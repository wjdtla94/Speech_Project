package setting;

import java.util.Hashtable;
import java.util.Set;


import org.reflections.Reflections;

public class ApplicationContext { //reflection을 통해 Bean에 대한 생성 관리
	Hashtable<String, Object> objTable = new Hashtable<>(); // 페이지 컨트롤러 기능을 관리

	public Object getBean(String key) { // 빈을 가져오는 메서드
		return objTable.get(key);
	}

	public ApplicationContext() throws Exception { 
		prepareAnnotationObjects();
	}

	private void prepareAnnotationObjects() throws Exception { // reflection을 활용하여 contextloaderLisener 기능을 줄일 수 있음
		Reflections reflector = new Reflections("");
		Set<Class<?>> list = reflector.getTypesAnnotatedWith(Component.class);
		String key = null;
		for (Class<?> clazz : list) {
			key = clazz.getAnnotation(Component.class).value();    
			
			objTable.put(key, clazz.newInstance());	//controller 객체 생성
		}
	}


}
