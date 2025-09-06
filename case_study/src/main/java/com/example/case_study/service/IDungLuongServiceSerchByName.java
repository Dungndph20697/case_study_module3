package com.example.case_study.service;

import com.example.case_study.model.DungLuong;

import java.util.List;

public interface IDungLuongServiceSerchByName {

    List<DungLuong> searchByName(String keyword);
}
