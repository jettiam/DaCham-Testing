package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

public interface NutritionistService {
	//���� �˻���
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
	// ���� ��ü�� ��ȸ�մϴ�.(with ��ǰ��, ������)
	public List<Nutritionist> sideAll(String foodGCode,Criteria criteria) throws Exception;
	//�ش� �Ĵܿ��� ���� �ֽ��� �Ĵ��� ���մϴ�.
	public int maxDiet() throws Exception;
	//���� ��ü�� ������ ���մϴ�.
	public int sideAllCount(String foodGCode) throws Exception;
	//�ش� ������������ �̴��� �޴��� ��ȸ�մϴ�.
	public List<OrderList> thisMonth(Criteria criteria) throws Exception;
	//�̴��� �޴��� ������ ���մϴ�.
	public int thisMonthCount() throws Exception;
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception;
	public Nutritionist materialView(String sideDCode) throws Exception;
	public List<Nutritionist> materialAll(Criteria criteria) throws Exception;
	public int materialTotal() throws Exception;
	public void create(Nutritionist nutritionist) throws Exception;
	public void createSide(Nutritionist nutritionist) throws Exception;
	public void createAmount(Nutritionist nutritionist) throws Exception;
	public Nutritionist openAPI(String foodMCode) throws Exception;
	public void createDiet(Nutritionist nutritionist) throws Exception;
	public List<Nutritionist> choiceDisease() throws Exception;
	public void createDietInfo(Nutritionist nutritionist) throws Exception;
	public Nutritionist showKcal(String sideDCode) throws Exception;
	public List<Nutritionist> optionTemplate(Nutritionist nutritionist) throws Exception;
//	���� ���ø��� ������ ���մϴ�.
	public int optionTemplateCount(Nutritionist nutritionist) throws Exception;
	//�Ĵ��� �ش� ������ �����Ͽ� ��ȸ�մϴ�.
	public List<Nutritionist> diseaseDietOverview(String diseaseName, Criteria criteria) throws Exception;
	//���� ��ϰ���� ������ ���մϴ�.
	public int diseaseDietCount(String diseaseName) throws Exception;
	//�ش� ������ ���� ī�װ� �˻�
	public List<Nutritionist> categorySearch(Nutritionist nutritionist) throws Exception;
	//�ش� ���� �������� �ֹ���� ǥ��
	public List<OrderList> orderList(Criteria criteria) throws Exception;
	//�ش� ���������� �ֹ���� ���� ���ϱ�
	public int orderList() throws Exception;
	//�ش� ������ ���� ��������
	public Nutritionist allNutri(String sideDCode) throws Exception;
	//�ش� Ư���Ĵ� ���� �������� ����Ʈ
	public List<OrderList> specialList() throws Exception;
	//�ش� Ư���Ĵ��� �� ����Ʈ�� view!
	public Counsel specialView(int counselCode) throws Exception;
	//�ش� Ư���Ĵ��� �� ������ �Բ� ���
	public void specialRegist(String customer) throws Exception;
	//�ش� ����û�� ��ϵ� Ư���Ĵ� toggle
	public List<Nutritionist> specialToggle(Nutritionist nutritionist) throws Exception;
	//Ư���Ĵ��� ��ϵǸ� ǥ��
	public void specialComplete(String customer) throws Exception;
	//�ش� Ư���Ĵ��� �ڵ带 ��ȸ�Ͽ� �ߺ� üũ
	public List<Nutritionist> specialCode(String customer) throws Exception;
	//�ش� Ư���Ĵ��� �߰� ����ϱ� ���� ���� �޼ҵ�
	public void reRegist(String customer) throws Exception;
	//�ش� Ư���Ĵ��� ��ٱ��Ͽ��� �� �� �ְ� �ɼǿ� ����
	public void optionInsert(Nutritionist nutritionist) throws Exception;
	//�ش� Ư���Ĵܿ� �ش��ϴ� �Խ��� ��ȣ�� �ִ� �亯�� ��ȸ��
	public String answer(int counselCode) throws Exception;
	//�ش� Ư���Ĵܿ� �ִ� �亯�� ��ũ�� �ɾ���
	public void answers(Nutritionist nutritionist) throws Exception;
	//�ش� ���� ����� 1ź
	public void remove1(String sideDCode) throws Exception;
	//�ش� ���� ����� 2ź
	public void remove2(String sideDCode) throws Exception;
	//�ش� ���� ����� 3ź
	public void remove3(String sideDCode) throws Exception;
	//�ش� ���� ����� 0
	public void remove0(String sideDCode) throws Exception;
	//�ش� �Ĵ� �����0
	public void delete0(int dietCode) throws Exception;
	//�ش� �Ĵ� ����� 1ź
	public void delete1(int dietCode) throws Exception;
	//�ش� �Ĵ� ����� 2ź
	public void delete2(int dietCode) throws Exception;
	//�ش� �Ĵ� ����� 3ź
	public void delete3(int dietCode) throws Exception;
}
