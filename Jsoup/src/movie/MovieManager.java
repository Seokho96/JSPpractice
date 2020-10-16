package movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dto.MovieVo;

public class MovieManager {
	
	public static List<MovieVo> getCGVdata() {
		
		Document doc;
		
		List<MovieVo> list = new ArrayList<MovieVo>();
		
		try {
			doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			
			// 영화제목
			Elements titles = doc.select("div.box-contents strong.title");
					
			/*		
			<div class="box-contents">
                <a href="/movies/detail-view/?midx=83160">
                    <strong class="title">반도</strong>
                </a>
			*/
			
			// 좋아요 %
			Elements likes = doc.select("div.box-contents span.percent");			
			
			/*
			<div class="box-contents">
			<div class="score">
                        <strong class="percent">예매율<span>23.0%</span></strong>                        
                        <div class='egg-gage small'>
                                        <span class='egg good'></span>
                                        <span class='percent'>79%</span>
                        </div>
                    
			*/
			
			for (int i = 0; i < 7; i++) {
				Element eTitle = titles.get(i);
				String title = eTitle.text();
				System.out.print(title + " ");
				
				Element eLike = likes.get(i);
				String like = eLike.text().replace("%", "");
				System.out.println(like);
				
				MovieVo vo = new MovieVo(title, Integer.parseInt(like));
				
				list.add(vo);
			}
					
					
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;		
	}

}





