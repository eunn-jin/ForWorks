package com.kh.forworks.comments.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.forworks.comments.service.CommentsService;
import com.kh.forworks.comments.vo.CommentsVo;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("comments")
public class CommentsController {

	private final CommentsService cmsv;
	
	@Autowired
	public CommentsController(CommentsService cmsv) {
		this.cmsv = cmsv;
	}
	
	@PostMapping("write")
	@ResponseBody
	public String write(CommentsVo vo, HttpSession session) {
		//System.out.println("댓글작성 시작");
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
        vo.setEmpNo(loginMember.getEmpNo());
        
        //db 다녀오기
        System.out.println(vo);
        int result =  cmsv.write(vo);
        //System.out.println("db갔다옴");
        //결과응답
        if (result == 1) {
            //s
            return "ok";
        }else {
            ///f
            return "fail";
        }
		
	}
	
	@PostMapping("delete")
	@ResponseBody
	public String delete(CommentsVo vo, HttpSession session) {
		
        //System.out.println(vo.getCmtNo());
        //db 다녀오기
        int result =  cmsv.delete(vo.getCmtNo());
        //System.out.println("db갔다옴");
        //결과응답
        if (result == 1) {
            //s
            return "ok";
        }else {
            ///f
            return "fail";
        }
	}
}
	
