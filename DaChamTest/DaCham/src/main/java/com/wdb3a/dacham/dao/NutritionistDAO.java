package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

public interface NutritionistDAO {
//	���� ����� �˻��մϴ�.
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
// ���� ��ü�� ��ȸ�մϴ�.(with ��ǰ��, ������)
	public List<Nutritionist> sideAll() throws Exception;
	//�ش� ������������ �̴��� �޴��� ��ȸ�մϴ�.
	public List<OrderList> thisMonth() throws Exception;
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception;
	public Nutritionist materialView(String sideDCode) throws Exception;
	public List<Nutritionist> materialAll() throws Exception;
	public void create(Nutritionist nutritionist) throws Exception;
	public void createSide(Nutritionist nutritionist) throws Exception;
	public void createAmount(Nutritionist nutritionist) throws Exception;
	public Nutritionist openAPI(String foodMName) throws Exception;
	public void createDiet(Nutritionist nutritionist) throws Exception;
	public List<Nutritionist> choiceDisease() throws Exception;
	public void createDietInfo(Nutritionist nutritionist) throws Exception;
	public Nutritionist showKcal(String sideDCode) throws Exception;
	public List<Nutritionist> optionTemplate(Nutritionist nutritionist) throws Exception;
//	���� ���ø��� ������ ���մϴ�.
	public int optionTemplateCount(Nutritionist nutritionist) throws Exception;
	//�Ĵ��� �ش� ������ �����Ͽ� ��ȸ�մϴ�.
	public List<Nutritionist> diseaseDietOverview(Nutritionist nutritionist) throws Exception;
	//�ش� ������ ���� ī�װ� �˻�
	public List<Nutritionist> categorySearch(Nutritionist nutritionist) throws Exception;
	//�ش� ���� �������� �ֹ���� ǥ��
	public List<OrderList> orderList(Criteria criteria) throws Exception;
	//�ش� ���������� �ֹ���� ���� ���ϱ�
	public int orderList() throws Exception;
	//�ش� ������ ���� ��������
	public Nutritionist allNutri(String sideDCode) throws Exception;
}
