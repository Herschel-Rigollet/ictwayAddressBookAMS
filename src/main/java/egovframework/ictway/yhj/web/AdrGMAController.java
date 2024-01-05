package egovframework.ictway.yhj.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.ictway.yhj.service.AdrGMAService;
import egovframework.ictway.yhj.service.AddressInfoVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 주소록 정보의 목록조회, 상세조회, 등록화면조회, 수정화면조회, 등록, 수정, 삭제, 파일업로드, 파일다운로드를 위한 컨트롤러 클래스
 * @author ICTWAY
 * @since 2024.01.04
 * @version 1.0
 * @Modification
 * <pre>
 *2024.01.04 / 염혜정 / 최초생성
 * </pre>
 * @see
 */
@Slf4j
@Controller
public class AdrGMAController {

	@Resource(name = "adrGMAService")
	private AdrGMAService adrGMAService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/**
	 * 주소록 목록조회
	 * @param request - session에 menuNo set 
	 * @param addrVO - 주소록 VO
	 * @return 주소록 목록
	 * @exception Exception
	 */
	@RequestMapping("/ictway/yhj/selectAdrGMAList.do")
	public String selectAdrGMAList(@ModelAttribute("searchVO") AddressInfoVO addressInfoVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("menuNo", "9000000");

		/** paging */
		addressInfoVO.setPageUnit(propertyService.getInt("pageUnit"));
		addressInfoVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(addressInfoVO.getPageIndex()); /** 현재 페이지 번호 */
		paginationInfo.setRecordCountPerPage(addressInfoVO.getPageUnit()); /** 한 페이지당 게시되는 게시물 건 수 */
		paginationInfo.setPageSize(addressInfoVO.getPageSize()); /** 페이지 리스트에 게시되는 페이지 건 수 */
		
		addressInfoVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		addressInfoVO.setLastIndex(paginationInfo.getLastRecordIndex());
		addressInfoVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = adrGMAService.selectAddressInfoList(addressInfoVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);
		
		/* return "cop/bbs/EgovNoticeList"; */
		return "ictway/yhj/adrGMAList";
	}
	
	/**
	 * 주소록 상세조회
	 * @param request
	 * @param addrVO - 주소록 VO
	 * @return 주소록 상세
	 * @exception Exception
	 */
	@RequestMapping("/ictway/yhj/selectAdrGMADetail.do")
	public String selectAdrGMADetail(@ModelAttribute("searchVO") AddressInfoVO addressInfoVO, ModelMap model) throws Exception {
		
		AddressInfoVO resultVO = adrGMAService.selectAddressInfoDetail(addressInfoVO);
		model.addAttribute("resultVO", resultVO);
		
		/* return "cop/bbs/EgovNoticeInqire"; */
		return "ictway/yhj/adrGMADetail";
	}
	
	/**
	 * 주소록 등록 화면
	 * @param addrVO - 주소록 VO
	 * @return 주소록 등록 화면
	 * @exception Exception
	 */
	@RequestMapping("/ictway/yhj/selectAdrGMARegist.do")
	public String selectAdrGMARegist(@ModelAttribute("searchVO") AddressInfoVO addressInfoVO, ModelMap model) throws Exception {
		
		/*return "cop/bbs/EgovNoticeRegist";*/
		return "ictway/yhj/adrGMARegist";
	}
	
	/**
     * 주소록 정보 등록
     * @param addressInfoVO - 주소록 VO
     * @return adrGMAId
     * @throws Exception
     */
    @RequestMapping("/ictway/yhj/registAdrGMAAct.do")
    public ModelAndView registAdrGMAAct(AddressInfoVO addressInfoVO, ModelMap model) throws Exception { 

    	ModelAndView mav = new ModelAndView("jsonView");
    	
		String adrGMAId = adrGMAService.registAddressInfoAct(addressInfoVO);
		mav.addObject("adrGMAId", adrGMAId);
		
		return mav;
    }
	
	/**
	 * 주소록 수정 화면
	 * @param addrVO - 주소록 VO
	 * @return 주소록 수정 화면
	 * @exception Exception
	 */
	@RequestMapping("/ictway/yhj/selectAdrGMAUpdate.do")
	public String selectAdrGMAUpdate(@ModelAttribute("searchVO") AddressInfoVO addressInfoVO, ModelMap model) throws Exception {
		
		AddressInfoVO resultVO = adrGMAService.selectAddressInfoDetail(addressInfoVO);
		model.addAttribute("resultVO", resultVO);
		
		return "ictway/yhj/adrGMAUpdate";
	}
	
	/**
     * 주소록 정보 수정
     * @param addressInfoVO - 주소록 VO
     * @return 
     * @throws Exception
     */
    @RequestMapping("/ictway/yhj/updateAdrGMAAct.do")
    public ModelAndView updateAdrGMAAct(AddressInfoVO addressInfoVO, ModelMap model) throws Exception { 

    	ModelAndView mav = new ModelAndView("jsonView");
    	
		adrGMAService.updateAddressInfoAct(addressInfoVO);
		
		return mav;
    }
    
    /**
     * 주소록 정보 삭제
     * @param addressInfoVO - 주소록 VO
     * @return 
     * @throws Exception
     */
    @RequestMapping("/ictway/yhj/deleteAdrGMAAct.do")
    public ModelAndView deleteAdrGMAAct(AddressInfoVO addressInfoVO, ModelMap model) throws Exception { 

    	ModelAndView mav = new ModelAndView("jsonView");
    	
		adrGMAService.deleteAddressInfoAct(addressInfoVO);
		
		return mav;
    }
}