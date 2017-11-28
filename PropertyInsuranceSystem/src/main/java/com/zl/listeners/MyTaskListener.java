package com.zl.listeners;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.service.EmployeeService;

@Service("myTaskListener")
public class MyTaskListener implements TaskListener{
	
	private static final long serialVersionUID = -5727737882827641188L;
	
	@Autowired
	EmployeeService employeeService;
	
	@Override
	public void notify(DelegateTask delegateTask) {
		// 获取当前节点的名称 ， 即任务节点的 name 值，也可使用 id 等都可以
		String currentActivityName = delegateTask.getExecution()
						.getCurrentActivityName();
		// 按条件随机查询出一名员工
		String id = employeeService.getEmployeeId(currentActivityName);
		delegateTask.setAssignee(id);
	}

}
