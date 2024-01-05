package egovframework.ictway.yhj.service;

import java.util.Map;

import org.egovframe.rte.fdl.cmmn.exception.FdlException;

/**
 * 주소록 정보 관리를 위한 서비스 인터페이스
 * @author ICTWAY
 * @since 2024.01.04
 * @version 1.0
 * @Modification
 * <pre>
 *2024.01.04 / 염혜정 / 최초생성
 * </pre>
 * @see
 */
public interface AdrGMAService {

	/**
	 * 검색된 목록과 건 수를 조회한다.
	 * @param addressInfoVO - 조회할 정보가 담긴 VO
	 * @return Map - resultList(목록), resultCnt(목록 건 수)
	 * @exception Exception
	 */
	Map<String, Object> selectAddressInfoList(AddressInfoVO addressInfoVO) throws Exception;

	/**
	 * 정보를 조회한다.
	 * @param addressInfoVO - 조회할 정보가 담긴 VO
	 * @return 정보 1건
	 * @exception Exception
	 */	
	AddressInfoVO selectAddressInfoDetail(AddressInfoVO addressInfoVO) throws Exception;
	
	/**
	 * 정보를 등록한다.
	 * @param addressInfoVO - 등록할 정보가 담긴 VO
	 * @return pk
	 * @exception FdlException
	 * @throws Exception 
	 */
	String registAddressInfoAct(AddressInfoVO addressInfoVO) throws FdlException, Exception;

	/**
	 * 정보를 수정한다.
	 * @param addressInfoVO - 수정할 정보가 담긴 VO
	 * @return void
	 * @exception Exception
	 */	
	void updateAddressInfoAct(AddressInfoVO addressInfoVO) throws Exception;

	/**
	 * 정보를 삭제한다.
	 * @param addressInfoVO - 삭제할 정보가 담긴 VO
	 * @return void
	 * @exception Exception
	 */	
	void deleteAddressInfoAct(AddressInfoVO addressInfoVO) throws Exception;
}