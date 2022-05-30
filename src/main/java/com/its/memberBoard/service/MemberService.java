package com.its.memberBoard.service;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;


    public void save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        memberDTO.setMemberProfileName(memberProfileName);
        String savePath = "C:\\spring_img\\" + memberProfileName;
        if(!memberProfile.isEmpty()) {
            memberProfile.transferTo(new File(savePath));
        }
        memberRepository.save(memberDTO);
    }

    public String duplicateCheck(String memberId) {
        String checkResult = memberRepository.duplicateCheck(memberId);
        if(checkResult == null) {
            return "ok";
        } else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberRepository.login(memberDTO);
        return loginMember;
    }

    public MemberDTO findById(String memberId) {
        MemberDTO memberDTO = memberRepository.findById(memberId);
        return memberDTO;
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
}
