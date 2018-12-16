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
	int selectPageCount();
	int checkPoint(String id);
	int usePointforFaceChat(PointMinus minus);

}
