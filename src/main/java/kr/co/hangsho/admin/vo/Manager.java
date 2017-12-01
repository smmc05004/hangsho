package kr.co.hangsho.admin.vo;

public class Manager {

	private Employee employee;
	private int deptId;
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	
	@Override
	public String toString() {
		return "Manager [employee=" + employee + ", deptId=" + deptId + "]";
	}
	
	
	
}
