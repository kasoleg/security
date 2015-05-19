<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<div id="page">
	<div id="page-content">
		<div class="slider slider_count_5">
			<!-- Список радиокнопок -->
			<input type="radio" id="selector1" name="selector">
			<input type="radio" id="selector2" name="selector">
			<input type="radio" id="selector3" name="selector">
			<input type="radio" id="selector4" name="selector">
			<input type="radio" id="selector5" name="selector">
			<div class="item" style="background: #caaa73;">
				<a href="#">
				<img src="<%=request.getContextPath()%>/resources/common/img/banners/1ea4d6d68025c_galaxys6edgehome.png.999xx.png" alt="Slider1">
				</a>
			</div>
			<div class="item" style="background: #e7e7e7;">
			<a href="#">
				<img src="<%=request.getContextPath()%>/resources/common/img/banners/431eae6a288de_iphone.jpg" alt="Slider2">
				</a>
			</div>
			<div class="item" style="background: #bbd3ef;">
			<a href="#">
				<img src="<%=request.getContextPath()%>/resources/common/img/banners/c93c7ab251b5f_electronicshome.png.999xx.png" alt="Slider3">
				</a>
			</div>
			<div class="item" style="background: #e2e2e2;">
			<a href="#">
				<img src="<%=request.getContextPath()%>/resources/common/img/banners/f6f09af5f3d25_ipadhome.png.999xx.png" class="slides slide4" alt="Slider4">
				</a>
			</div>
			<div class="item" style="background: #7a40ab;">
			<a href="#">
				<img src="<%=request.getContextPath()%>/resources/common/img/banners/fe569ae295035_sonyheadphonehome.png.999xx.png" alt="Slider5">
				</a>
			</div>
			<!-- Контейнер меток с цифрами. По клику на них выбирается слайд и отменяется вся анимация -->
			<div class="selector_list">
				<label for="selector1">1</label>
				<label for="selector2">2</label>
				<label for="selector3">3</label>
				<label for="selector4">4</label>
				<label for="selector5">5</label>
			</div>
		</div>
	</div>
</div>