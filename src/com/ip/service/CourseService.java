package com.ip.service;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseCategoryBean;
import com.ip.dao.CourseCategoryDao;
import com.ip.dao.CourseDao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CourseService {
    private final CourseDao courseDao = new CourseDao();
    private final CourseCategoryDao categoryDao = new CourseCategoryDao();

    public List<CourseCategoryBean> getSubCategories(int parentId) {
        return categoryDao.findByParentId(parentId);
    }

    public List<CourseBean> getCoursesByCategoryId(int categoryId) {
        return courseDao.findByCategoryId(categoryId);
    }

    public Map<CourseCategoryBean, List<CourseBean>> getCoursesGroupedBySubCategory(int secondLevelCategoryId) {
        Map<CourseCategoryBean, List<CourseBean>> map = new LinkedHashMap<>();
        List<CourseCategoryBean> subCategories = getSubCategories(secondLevelCategoryId);
        for (CourseCategoryBean subCat : subCategories) {
            List<CourseBean> courses = getCoursesByCategoryId(subCat.getId());
            map.put(subCat, courses);
        }
        return map;
    }
}
