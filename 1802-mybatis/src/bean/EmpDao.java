package bean;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class EmpDao {
	/*
	 * 필드
	 */
	SqlSession sqlSession;
	
	/*
	 * 생성자
	 */
	public EmpDao() {
		try {
			sqlSession = BeginFactory.getFactory().openSession();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	/*
	 * 메소드들
	 */
	// '한 명' 검색용
	public EmpVo select(String id) {
		EmpVo vo = (EmpVo)sqlSession.selectOne("emp.select", id);
		
		sqlSession.close();
		return vo;
	}
	
	// '여러명' 검색용
	public List<EmpVo> select2(String findStr) {
		List<EmpVo> list = sqlSession.selectList("emp.select2", "%" + findStr + "%");
		
		sqlSession.close();
		return list;
	}
	
	// 입사년으로 => 해당년도에 입사한 직원들을 조회
	public List<EmpVo> selectHire(String year) {
		List<EmpVo> list = sqlSession.selectList("emp.select_hire", year);
		
		sqlSession.close();
		return list;
	}
	
	// 입사월로 => 해당월에 입사한 직원들을 조회
	public List<EmpVo> selectHireMonth(String hireMonth) {
		System.out.println("hireMonth: " + hireMonth);
		List<EmpVo> list = sqlSession.selectList("emp.select_hireMonth", hireMonth);
		
		sqlSession.close();
		return list;
	}
	
	// 사원명, 입사년을 입력받음
	public List<EmpVo> selectWhere(String first_name, String hire_year) {
		System.out.println("first_name: " + first_name);
		System.out.println("hire_year: " + hire_year);
		
		WhereVo whereVo = new WhereVo();
		whereVo.setFirst_name(first_name);
		whereVo.setHire_year(hire_year);
		
		System.out.println(whereVo.getFirst_name());
		System.out.println(whereVo.getHire_year());
		
		List<EmpVo> list = sqlSession.selectList("emp.select_where", whereVo);
		
		sqlSession.close();
		
		System.out.println("list.size(): " + list.size());
		return list;
	}
	
	// 3. Departments
	public List<DeptVo> foreachTestDeptList() {
		List<DeptVo> deptList = null;
		try {
			deptList = sqlSession.selectList("emp.dept_list");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return deptList;
	}
	
	
	public List<EmpVo> foreachTest(String[] dept) {
		// 찾는 용도
		List<String> temp = Arrays.asList(dept);
		
		// 받는 용도
		List<EmpVo> list = null;
		try {
			list = sqlSession.selectList("emp.foreach", temp);
			System.out.println("dao.foreachTest: " + list.size());
			sqlSession.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	
} // End of Class
