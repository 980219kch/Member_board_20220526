package com.its.memberBoard.controller;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.dto.CommentDTO;
import com.its.memberBoard.dto.PageDTO;
import com.its.memberBoard.service.BoardService;
import com.its.memberBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println("boardDTO = " + boardDTO);
        boardService.save(boardDTO);
        return "redirect:/board/paging";
    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<BoardDTO> boardDTOList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", paging);
        return "boardPages/pagingList";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "boardPages/detail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "/boardPages/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "redirect:/board/paging";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }

    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("search") String search, Model model) {
        List<BoardDTO> searchList = boardService.search(searchType, search);
        model.addAttribute("boardList", searchList);
        return "boardPages/list";
    }

}
