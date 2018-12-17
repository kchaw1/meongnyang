package com.nmcat.point.serivce;

import java.util.List;

import com.nmcat.repository.domain.Page2;
import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.domain.PointPlus;

public interface PointService {

	int buyPoint(PointPlus plus);
	List<PointPlus> selectAddPoint(String id);
	List<PointPlus> selectPagePoint(Page2 page2);
	List<PointMinus> selectMinusPoint(String id);
	int selectPageCount(String id);
	List<PointMinus> selectMinusPage(Page2 page2);
	int selectMinusCount(String id);
	int checkPoint(String id);
	int usePointforFaceChat(PointMinus minus);
	/*void deletePlus(int no);*/

}
