package com.tencent.taes.framework.server.eventbus;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class M2MHashMap<K, V> {
    private static final boolean DUMP = false;
    private HashMap<K, Object> map = new HashMap<>();

    public void put(K key, V value) {
        Object object = this.map.get(key);
        if (object == null) {
            this.map.put(key, value);
            return;
        }
        if (object instanceof HashSet) {
            HashSet<V> valueSet = (HashSet) object;
            valueSet.add(value);
        } else {
            HashSet hashSet = new HashSet();
            hashSet.add(object);
            hashSet.add(value);
            this.map.put(key, hashSet);
        }
    }

    public void remove(K key, V value) {
        Object object = this.map.get(key);
        if (object != null) {
            if (object instanceof HashSet) {
                HashSet valueSet = (HashSet) object;
                valueSet.remove(value);
                if (valueSet.size() == 0) {
                    this.map.remove(key);
                    return;
                }
                return;
            }
            if (object == value) {
                this.map.remove(key);
            }
        }
    }

    public void remove(K key) {
        this.map.remove(key);
    }

    public List<K> removeValue(V value) {
        List<K> removedKeys = new ArrayList<>();
        Iterator<Map.Entry<K, Object>> iterator = this.map.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<K, Object> entry = iterator.next();
            K key = entry.getKey();
            Object object = entry.getValue();
            if (object != null) {
                if (object instanceof HashSet) {
                    HashSet valueSet = (HashSet) object;
                    if (valueSet.remove(value)) {
                        removedKeys.add(key);
                    }
                    if (valueSet.size() == 0) {
                        iterator.remove();
                    }
                } else if (object.equals(value)) {
                    iterator.remove();
                    removedKeys.add(key);
                }
            }
        }
        return removedKeys;
    }

    public Set<V> getValueSet(K key) {
        Object object = this.map.get(key);
        if (object == null) {
            return null;
        }
        if (object instanceof HashSet) {
            HashSet<V> valueSet = (HashSet) object;
            return valueSet;
        }
        HashSet hashSet = new HashSet();
        hashSet.add(object);
        return hashSet;
    }

    public Set<K> keySet() {
        return this.map.keySet();
    }

    public Collection<V> values() {
        ArrayList arrayList = new ArrayList();
        for (Object value : this.map.values()) {
            if (value instanceof HashSet) {
                arrayList.addAll((HashSet) value);
            } else {
                arrayList.add(value);
            }
        }
        return arrayList;
    }

    public V get(K key) {
        Collection<V> values = getValueSet(key);
        if (values != null) {
            Iterator<V> it = values.iterator();
            if (it.hasNext()) {
                V value = it.next();
                return value;
            }
            return null;
        }
        return null;
    }

    public boolean contains(K key, V value) {
        Object object = this.map.get(key);
        if (object != null) {
            if (object instanceof HashSet) {
                HashSet valueSet = (HashSet) object;
                return valueSet.contains(value);
            }
            if (object.equals(value)) {
                return true;
            }
            return false;
        }
        return false;
    }

    public boolean containsKey(K key) {
        return this.map.containsKey(key);
    }

    public boolean isEmpty() {
        return this.map.isEmpty();
    }

    public int size() {
        return this.map.size();
    }

    public void clear() {
        this.map.clear();
    }

    public void dump(String s) {
        StringBuilder sb = new StringBuilder();
        sb.append(s);
        sb.append("\n");
        for (Map.Entry<K, Object> entry : this.map.entrySet()) {
            sb.append("--");
            sb.append(entry.getKey());
            sb.append("\n");
            Object object = entry.getValue();
            if (object instanceof HashSet) {
                Collection<V> vs = (HashSet) object;
                for (V v : vs) {
                    sb.append("----");
                    sb.append(v.getClass().getSimpleName());
                    sb.append("|");
                    sb.append(v.hashCode());
                    sb.append("\n");
                }
            } else {
                sb.append("----");
                sb.append(object.getClass().getSimpleName());
                sb.append("|");
                sb.append(object.hashCode());
                sb.append("\n");
            }
        }
    }
}
