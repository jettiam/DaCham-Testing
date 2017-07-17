package com.wdb3a.dacham;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wdb3a.dacham.bean.AppTest;
import com.wdb3a.dacham.bean.ChartPrice;
import com.wdb3a.dacham.bean.Member;
import com.wdb3a.dacham.service.AdminMainService;

@Controller
public class FcmPushController {
	@Inject
	private AdminMainService service; 
	public final static String AUTH_KEY_FCM = "AAAAnH0aVew:APA91bEQ6th6gQGJTZ9LqE_xLEct3i4CZgYLMEeL5K2EeCSJ8M8nZcAxFabBEWTVMJs6sWujl9-bdgicoUtXiJCW7FkuIfGr2xxxtYFBg65lR6WsQzOUExKCNtshqoNUuuam8DrLj_Gd";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

	// userDeviceIdKey is the device id you will query from your database
	@RequestMapping(value = "AppSending", method=RequestMethod.POST)
	public String pushFCMNotification(String foodMAppOrderInfo) throws Exception {
		System.out.println("ddd");
		String authKey = AUTH_KEY_FCM; // You FCM AUTH key
		System.out.println(authKey);
		String FMCurl = API_URL_FCM;
		String token = service.appTest("test");
		int totalprice; 
		String toString="";
		JSONParser jsonParser = new JSONParser(); 
		JSONObject jsonObj = (JSONObject) jsonParser.parse(foodMAppOrderInfo);
		for(int i=0; i<jsonObj.size(); i++){
			JSONObject jsonObj1 = (JSONObject) jsonObj.get(i+"");
			totalprice = (int) (Integer.parseInt(jsonObj1.get("price").toString()) * Double.parseDouble(jsonObj1.get("totalAmount").toString()));
			System.out.println(jsonObj1); 
			System.out.println(jsonObj1.get("foodMname").toString());
			toString = toString + "\n" + "식재료명 : " +jsonObj1.get("foodMname").toString() + "단가 : "+  jsonObj1.get("price").toString() + " 주문량 :" + jsonObj1.get("totalAmount").toString() + jsonObj1.get("unit").toString() + " 총가격 : " + totalprice + "원";  
		} 
		String content = toString;    // 내용
		URL url = new URL(FMCurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + authKey);
		conn.setRequestProperty("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		JSONObject info = new JSONObject();

		info.put("body", content); // Notification body

		json.put("notification", info);
		json.put("to", token.trim()); // deviceID

		try (OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(), "UTF-8")) {
			// 혹시나 한글 깨짐이 발생하면
			// try(OutputStreamWriter wr = new
			// OutputStreamWriter(conn.getOutputStream(), "UTF-8")){ 인코딩을 변경해준다.

			wr.write(json.toString());
			wr.flush();
		} catch (Exception e) {
		}

		if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
			throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

		String output;
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			System.out.println(output);
		}

		conn.disconnect();
		return "redirect:orderList";
	}
 
	/*public static void main(String a[]) throws Exception {
		try {
			FcmPushController.pushFCMNotification("push code 부분 ");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}*/

}
