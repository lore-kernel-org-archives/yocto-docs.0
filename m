Return-Path: <nabsyed@ebay.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FE3C43219
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from esa.hc2186-20.iphmx.com (esa.hc2186-20.iphmx.com
 [216.71.154.29])
 by mx.groups.io with SMTP id smtpd.web08.11091.1650049194905436226
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ebay.com header.s=ebaycorp header.b=y4AUJ2GF;
 spf=pass (domain: ebay.com, ip: 216.71.154.29, mailfrom: nabsyed@ebay.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ebay.com; i=@ebay.com; q=dns/txt; s=ebaycorp;
  t=1650049195; x=1681585195;
  h=from:to:subject:date:message-id:mime-version;
  bh=7MYrjZrpFjjhhwOXfVRYqmZumC0kXYoSxfsGS5HNQBY=;
  b=y4AUJ2GFIIF1S79rsvSJ/aya0spy0L+35eetX8kGxfoGWD7pDFXSvwIw
   p2gtBZ/TsJteuQK91BzIbsxQ5u2rj/ZiMOA5oKOzrwLEhD3vt/9gg9DS1
   /KVW/XEmOIIwRuDlfZfQpAXihUEEr9TVM3kit6td1JoUVk68R9PCkUJO4
   8=;
X-IronPort-RemoteIP: 216.113.162.88
X-IronPort-MID: 173458748
X-IronPort-Reputation: 5.2
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: Vontu_to_CES_Outbound
X-IronPort-MailFlowPolicy: $Vontu_to_CES_Outbound
X-EBay-Corp: Yes
X-IPAS-Result: =?us-ascii?q?A2GDAADrv1limFiicdhaHgEBCxIMQIFPC4EhgQd8AjqGQ?=
 =?us-ascii?q?41Dn3CBfAsBAQEBAQEBAQEHAkMEAQGFBgKEfiY0CQ4BAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAwEBBgEBAQEBBwQBAQIQAQEBAQEBAQEHDQkHBgwFDhAFIoVpDII1IoQMH?=
 =?us-ascii?q?F4BDHQmAQQbgnwBgg6YGYMwAQGJNAGLGIEzgQGCFASFbAOBdYE9hziDA4Rfg?=
 =?us-ascii?q?UpDgViHbIQLgi4Emm+Bf4J0oASgdwMHg0mgHhWoU5ZeIKZKAgQCBAUCDgiBY?=
 =?us-ascii?q?YIWcBWDJVAZD445jjeBLQIGCwEBAwmMRgEB?=
IronPort-PHdr: A9a23:/rvQLR/QJzL2S/9uWVC7ngc9DxPPW53KNwIYoqAql6hJOvz6uci4Z
 gqGtKgm1QSTFazgqNt8w9LMtK7hXWFSqb2gi1slNKJ2ahkelM8NlBYhCsPWQWfyLfrtcjBoV
 J8aDAwt8H60K1VaF9jjbFPOvHKy8SQSGhLiPgZpO+j5AIHfg9qp2+yo5pHeZwVFiDWgbb58M
 hm9sBncuNQRjYZ+MKg61wHHomFPe+RYxGNoIUyckhPh7cqu/5Bt7jpdtes5+8FPTav1caI4T
 adFDDs9KGA6+NfrtRjYQgSR4HYXT3gbnQBJAwjB6xH6Q4vxvy7nvedzxCWWIcv7Rq0yVD+/7
 alkVQXohT8HOTAn7W/XlsJ+gqFHrx2uvBFw2ZLYbJ2POfZiYq/RY9UXTndBUMZLUCxBB5uxY
 4USAesBI+lXspHxrEYWoxSkHgajGv3gyjtGinTr2qA61f4uHhrd3A0gAd0BrW/Zo8vuO6gIU
 eG51rXHzTLGb/5P3zr29YfHfAw7r/6WQbJwbdTeyVMpFw7dklieqY3oMjyX2+kNrmSX8eRtW
 OyhhmMjpA9/oiWjytsxhoTVmo8YzlTJ+CZlzYooJtC1SUF2bMCmHZZSuCyXNY17Sd4hTWFwo
 Cs21KAKtJ+hcCQX1ZgqyQTTZ+GGfoSW+B7uV+WcLS9miH9kZL6yiRO//VW8xuLnV8S51UxFo
 jZLn9TJqHwByxLT582CR/dg/Eqs3yuE2RrJ5eFeO080kLLWK5smwrEtiJUeqV/DHirqmEXui
 6+Wa1kk9vCo6+v5ZrXmoYeRN4tqigHlK6gum9S/Dv4kMggJWmiX4Piw2KH98UHjXLpKiec2k
 rHDvJ/EPssUvK64DxVJ3YYk7hazFzam0NIGknkbNF9JZg+LgonzN13TPfz1A+2zj0mtnTt13
 fzLPb7sDo3ILnfZkbfhebh961RbyAo21d1f4YhbBaoaIPPzRED+qcfVAQEiPAOuw+frEsly1
 oQbWW6XBK+WK7vdsUWU6eI3P+mMeIgVtS7gJ/Q9/f7hkWc5mUMBfamuxZYYdXe4Eeh9I0iCZ
 Xrsg8wBEXsRvgYkTO3qj0GNUSJUZ3aqRaI84TM7B5y6AoffXIyth6aB3CjoVqFRMypKDVuXO
 XPpbJmfHeYLYz6VOtVmkDEPSf6mUYBrnUWiswTh475mNfbPvDwfvo7kzMJy5eDYiVc17zMiX
 OqH1GTYBVplk29MDxk/1q1ypQY1nlGK27NpjvBwGNZa9rVCVQJsZs2U9PBzF92nAlGJRdyOU
 lvzGr1OSRk9TdM0ltkJZUs1W9CvlQvK0CfiBbgJ36eKC5o5/uO5vTDxKs9xxmyA2PwniF8rE
 cdKPHet06h48QWbDoXVkkKfwqCtc6lU3CPE+GqZi2SUu0QNXQR5QOPOWnVMDnY=
IronPort-Data: A9a23:CLGqWK08AJt6H9bymfbD5fBxkn2cJEfYwER7XKvMYLTBsI5bpzFUz
 jQYDGrSaK6DYjCkctFwPIuxoBkAvp6BydM2SlQ/3Hw8FHgiRegppzi6BhypY37NdJ2roGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9BGQ7InQLlbGILas1htZGEk1EE/NtTo5w7Rj2tIx3IDja++wk
 YqaT/P3aQfNNwFcbzp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFontR5fMebS4K8bhL
 wr1IBBVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4Bbm
 Ipch56wcwRzEvbMxNUkQyhZLD4raMWq+JefSZS+mciN1AjHa3LwxPArVBlse4Yf4P4xDGtH5
 LoTLzVlghKr3bvohuviEa812J5lfJmD0IA34xmMyRnfBPw9UJ3Pa6jA7M4e1zA17ixLNa+BP
 JZEOWUzPHwsZTVDPAwFKIAwvdumxWv7WmRfhHDFoJAotj27IAtZi+O8aoS9lsaxbclSlV2wo
 mPd43+/ExYRKNuH0z2H/3mwwOjVkkvGtJk6EKOjs/JumFqO2mYUFRsaE1C8u+H/h0S3SpRUL
 El8FjcSQbYapGb7EcjPXR2CoySo5R5AauNAIuwF91TYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mO0c8PV6S9H7OXIFizFnluAhXbrYHFFcj9dDcMRZVZdu7HeTJcPYgUjpzqJOJW8iNHkcd0b6
 2DW9Hdm71n/YDNi6klW1VTZmHegooDOUxI/4RjRUiSu6RlhIoOvbp3u4l/ehRqhEGp7ZgTQ1
 JTns5LFhAzrMX1rvHfTKAnqNOr3j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5VIBvc4MYiX2Mf4fj2eN5yICkvKI+TPNCay8UzaySsMZmPKvp3k/OhD4M57FzBV0+U3AB
 XtrWZ33XCxEYUiW5De8TvZ17FPY7n9W+I8nfriil07P+ePHPBa9EO5ZWHPTMLxRxP7a8W39r
 ocHX+PXmk43eLCvPUH/r9VJRXhUdidTOHwDg5ENHgJ1ClA4SDhJ5j646e5JRrGJaIwMz7mTr
 yDhABIAoLc97FWeQTi3hrlYQOuHdf5CQbgTZETA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:sgoNTqx8ap56PbVq/T8XKrPwFr1zdoMgy1knxilNoHtuHvBw9v
 rAoB1/73TJYVkqNk3I9ergBEDjewK+yXcF2+ks1N6ZNWGN1VdAR7sSj7cKrQeQfBHWx6pw0r
 phbrg7KPCYNykdsS8i2njcLz/3+qjizJyV
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400";
   d="scan'208,217";a="173458748"
Received: from lvs-dlpoutbound.corp.ebay.com (HELO
 lvs-ipatom-002.corp.ebay.com) ([216.113.162.88])
  by esa3.hc2186-20.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 11:59:53 -0700
X-ATOM: Processed_By_ATOM
X-IronPort-Trust: True
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
  by atom.corp.ebay.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 11:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7CvslLhGES/LWq5zJkVhC+ga3Irx2WJhlOjsCWvw0DgEObPRHyro2x7mEs/JhO6JZddR6QGEs9RfSLvx4kpLaDBT/Cop7OhvNAw7RhspyrEKQt/cmtBhNEhrEan3gu8ZjRsntbrn6qDOUX87wOfFS5+YEwH6A4wCl0eXpw9ppGr8Iv9nYGo7U4x/Iv49BR6zB/sDGLFW83hYtKyiJJtygpC4SYZ/12pBOtYcMdaLFNGKhWxCTt7kVAURSjqrWKcAXd6Q0dfY2OJV+oItepgl4F8XC0K1eGDjRrLRpoIwK7/GFGwXVxx7xVlIvbObtNQmNLP5eyMbRRpWiadXqXagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YxmZOq+ICJxbu67I9j5/ED+wH+F7IXJXOwglTWg7vw=;
 b=DP8/77g494gFFTy93xuAarDqsLHPCVf1KYc+CVJYZ68KPRnwZ5L1a7vOFjYev3kjJem42yx9qN0PMdkvfDEOsbrnVwir0Ccpb6WcYvHPoEbMJ4BrYVCeIWuEuo8pEik9JDKhTA8TLLIMD8DnsSyKyihvfIuC5Wl52EuLW0gZM5zrBQmG63TWPxl5Rn2brLMx0JgPslBd/kr4m2bqaU/2GGxhxe0fQGaVE62/h73cddVwSpuJWlDACQfTFD7/xsJtcIBGe8i4HAdDWIBkpwBFYH9LixJ+KlHHZp4IAUe4bH5i346SXPR3wMGjuKmSuk8nB7znLFpaf41erjdGJjOXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebay.com; dmarc=pass action=none header.from=ebay.com;
 dkim=pass header.d=ebay.com; arc=none
Received: from BY5PR07MB7251.namprd07.prod.outlook.com (2603:10b6:a03:20f::17)
 by DM5PR07MB3943.namprd07.prod.outlook.com (2603:10b6:4:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 18:59:44 +0000
Received: from BY5PR07MB7251.namprd07.prod.outlook.com
 ([fe80::29d8:1ec9:ccbf:e53c]) by BY5PR07MB7251.namprd07.prod.outlook.com
 ([fe80::29d8:1ec9:ccbf:e53c%5]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 18:59:44 +0000
From: "Syed, Nabeel" <nabsyed@ebay.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: IPv6 Autogeneration Not Persisting
Thread-Topic: IPv6 Autogeneration Not Persisting
Thread-Index: AdhQ+oxJbHnb8GYUR5GvS3X9IklhGg==
Date: Fri, 15 Apr 2022 18:59:44 +0000
Message-ID: 
 <BY5PR07MB7251BEE4347F7AD55ED1B328CCEE9@BY5PR07MB7251.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebay.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb979c8c-5b49-494e-e900-08da1f121ad7
x-ms-traffictypediagnostic: DM5PR07MB3943:EE_
x-microsoft-antispam-prvs: 
 <DM5PR07MB39430971FBFA4269A21180BDCCEE9@DM5PR07MB3943.namprd07.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HjnAm8l5djHWK3Q9EXptn1eq5Te6fyh49GTSSKRRVa5XNtPk4DvelU89rJrjLiK6FBGctBK+f8ruQPLbzs7R5w6Vx08m4EsjjBWuqsdmjk/HYqihGnbd0eSM+h3hqfgFoz49rgraK9Vu3fsCen1mVwjVCG5T43oMtZIXKdSx2xaVIhbIZaYybfgToIJzF0mmneLjXp9l42LofmVxTOQ4EOkQm8EQdeS9GnCJpQS4jt4JOvY3OVrfFDMERThUe0rmOFSJgqgbA6wia7PlP7w/jE7x9BiDhbzUxBmw6TMo3QnQDXRXEJTau/KTv8vh9qPdGT7wXhi3SxNH6MiageC0Ny4Msbknme8QGrr3bS7nRc2mcAJmFvjqjgHk36NFeBwt0VNjI/zvNfbrmtR+xzXVufOx9fZteYo3azOee7I+V6QqLetdbCLJKyU7ZtkbZig16beGsTJpLA7IRvWR/aKoT13/Wsot9wcoJxTUPDGqBDRFWIwf63ioksvoLB0/H/PPHZ2FwlcC5RvF7vpAs9O8wTr3wjqekBamYrVrPcaj0XkqQ++8EBA3C8uj2q3dmGpXLn3u1QGZ/YPmnn6VUPISdVLWEbO29VVX+3SugjIdv07huOJiZ7V5ig2YkIvx8gAaemFISJMp4y8BjnHsaDoB2mVpUGB74pevDdflYHuqYFygAlqtdSKvddpWz6kPS0KiiENIr0aSDlOdWV88CgR5dA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR07MB7251.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(508600001)(10290500003)(7696005)(2906002)(9686003)(6506007)(186003)(26005)(122000001)(82960400001)(38100700002)(86362001)(6916009)(55016003)(33656002)(316002)(5660300002)(64756008)(4744005)(8676002)(52536014)(8936002)(71200400001)(76116006)(66476007)(66946007)(66556008)(66446008)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?q7G2qeGUeQ3L9iBNT1VrKnClYDxeYvjbUcIsLzeyz/tpGYmujQ6BnyMVKXvn?=
 =?us-ascii?Q?RAz9XA9Scmo8lTKGvjWOLzm5bDRL8p2sGbttRmojiLspBST97QaNkUgBif8i?=
 =?us-ascii?Q?cc/VKMqw/hq3LBSPNn04pkSCIMX8gf8Q5tP0ABlO0B9l8fmYdZc+fWcQPmh2?=
 =?us-ascii?Q?oJLl10ArChEjuIzIIEi/6Dnwsd0vnRtJRbzY4bjgTQmLUo3JovWFQsXj82fO?=
 =?us-ascii?Q?BNBzl38TJGnfmTWwTruEiyvMc5UXN1hoaQ/ecVtdFSCYjeyZtgvYQXgchw6T?=
 =?us-ascii?Q?fF138ypf4HMwXFA4v1H8F49D2dr850DIuyEnAMZ6F/llQD6hhdzlgXEEIeU4?=
 =?us-ascii?Q?biafONsO1aEaxZmeOSYhU+Nux7uu09idUTtLAr/h8aqaMNaEnl7qrsBybCHL?=
 =?us-ascii?Q?jbF4ZRkBiBm3B3HinLqF8160AzAV6F3+p7pShHs6dW61eMDGbyVo9jb5Hfkn?=
 =?us-ascii?Q?hussiylFwFHWkwyPEBs9/rWjMIaK3tltXGPh6zDgnz3ZlD6aPkIjD99jCXtZ?=
 =?us-ascii?Q?kmg7YQqJM/4bFSubL+tvq/9h0v4ZtGyWdCJr436sNBF5vM9lh7lSB0n+k5A+?=
 =?us-ascii?Q?hwGoTK581hPqiZt9UXrZAVLLyKCYv3R1HkvTlLfbOzwTFkzqAMaqXCTSsAuW?=
 =?us-ascii?Q?0/PjR2yyZ9qEKET7a8pkKAoeqWcieGSdL5v2fhhVjy+4N1fZzdwbc0wKuAy3?=
 =?us-ascii?Q?ucp6B618B9oWDYmO8wfDNRS3OvLlD0aGFoQElkcwoiYMKq5gtWsoW12DWZT0?=
 =?us-ascii?Q?1qBL/Whf7TLi5Kf1XtbDzg4xqLlmXM8dSj/wbLhvtL9u3iZlQlQG/KJf+Iyd?=
 =?us-ascii?Q?Hd5lmwbqsr9E0m3tnB1AktLfXFUAmL+VI73hwQjyWhdNt87kIy/j8IqVcEVI?=
 =?us-ascii?Q?Lprd+1ETUnxLUnb7/veTAT6nA1MiSiN8N6O0AIuO5/K7jcvAPvcVYg1Soaf8?=
 =?us-ascii?Q?pvj6zb7bzUD0kc0+t3/3OHvvEOdjR7lv8qXvbipvEmjF/Vq6jeUAramrsq9L?=
 =?us-ascii?Q?887W8wC6XvtOBy6NznUBBHTH0W0MB+ivbe933UHT8DQqsKRqbmD9vYsAFNCC?=
 =?us-ascii?Q?1RGSt6ijj87qJdbXFSRPUp8PnuXPuFeQ/Sye/peUTkY2JD9I0iXnEtWJ2eF4?=
 =?us-ascii?Q?OJHNTH226PFWMy9qxiwXE4QXal6rX4Y9QZEmLHMEJMQ9BJUlfT5kncxMi/lE?=
 =?us-ascii?Q?fBy5D/Oc8fZoJZDr+7mU4CwqDX4nawwEG1d+lCAcGu0/eXV6dB7fC9UgHyQh?=
 =?us-ascii?Q?r8dIfPgn/aU4s/hyQ/H9fUGfQGI0bdwFo8WRU7kEu3w/+ropX+Vy22eSH+nY?=
 =?us-ascii?Q?7inYPY3yakIHNQ/9Je0t4+6EdbIJAvvJuYfRKlyl2jWgYZZ030qpkXng69oj?=
 =?us-ascii?Q?j8VTikEleg2Y0fPWPO3oEDuJi/SjkIJEeo3q8flzBBbpZIEp1PXysdcofQ7W?=
 =?us-ascii?Q?cTzu3Ug+ocM+XAXYBy4red2zy6I2HfJssCYD2xVQWaGzgNxWZfWF6FNaKBt5?=
 =?us-ascii?Q?myAPMNbmZuK+tz5temmWmsW06/M7L9LeaM9OCLORUExGXd34bLktdoyJsp9d?=
 =?us-ascii?Q?Cr8L2XQ09q0oAyfPU/jSncce8KWgpUq9/RJ3P6uZMdceaVVOSryCd3h1tyJL?=
 =?us-ascii?Q?2LSWrdAQSa1ss/hr90Yk6I72gXC2uHvnmk7wiNsAZWcPyqxeHwl9DZVtzNLd?=
 =?us-ascii?Q?05C6VZJLzJp5lM9LRm3sEoRRDg2BlPFc32subdc7tqyDLxAlWDUDSViGDdWd?=
 =?us-ascii?Q?j7qcaxWnyw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BY5PR07MB7251BEE4347F7AD55ED1B328CCEE9BY5PR07MB7251namp_"
MIME-Version: 1.0
X-OriginatorOrg: ebay.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR07MB7251.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb979c8c-5b49-494e-e900-08da1f121ad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 18:59:44.5795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46326bff-9928-41a0-baca-17c16c94ea99
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 u05FUKysl0yiLOhvt0/NBsfvt064PUcrG3m+9XALINp1c/PX+jAuVoQMBmfs0IiDXYxPitIEt0cwr8INsOWqaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3943
X-CFilter-Loop: Reflected
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2780

--_000_BY5PR07MB7251BEE4347F7AD55ED1B328CCEE9BY5PR07MB7251namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm trying to auto-generate IPv6 for interfaces on a ZPE Systems device but=
 not able to. It keeps reverting to a value of '1' after a reboot even thou=
gh the config file clearly has '3'. Anyone run into something similar?


root@device:/home/admin# cat /proc/version
Linux version 5.4.137-yocto-standard (oe-user@oe-host) (gcc version 9.3.0 (=
GCC)) #1 SMP PREEMPT Sat Jul 31 06:19:39 UTC 2021

root@device:/home/admin# sysctl net.ipv6.conf.sfp0.addr_gen_mode
net.ipv6.conf.sfp0.addr_gen_mode =3D 1

root@device:/home/admin# cat /etc/sysctl.conf | grep net.ipv6.conf.sfp0.add=
r_gen_mode
net.ipv6.conf.sfp0.addr_gen_mode=3D3


Nabeel


--_000_BY5PR07MB7251BEE4347F7AD55ED1B328CCEE9BY5PR07MB7251namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I&#8217;m trying to auto-generate IPv6 for interface=
s on a ZPE Systems device but not able to. It keeps reverting to a value of=
 &#8216;1&#8217; after a reboot even though the config file clearly has &#8=
216;3&#8217;. Anyone run into something similar?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@device:/home/admin# cat /proc/version<o:p></o:p=
></p>
<p class=3D"MsoNormal">Linux version 5.4.137-yocto-standard (oe-user@oe-hos=
t) (gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Sat Jul 31 06:19:39 UTC 2021<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@device:/home/admin# sysctl net.ipv6.conf.sfp0.a=
ddr_gen_mode<o:p></o:p></p>
<p class=3D"MsoNormal">net.ipv6.conf.sfp0.addr_gen_mode =3D 1<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@device:/home/admin# cat /etc/sysctl.conf | grep=
 net.ipv6.conf.sfp0.addr_gen_mode<o:p></o:p></p>
<p class=3D"MsoNormal">net.ipv6.conf.sfp0.addr_gen_mode=3D3<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Nabeel<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BY5PR07MB7251BEE4347F7AD55ED1B328CCEE9BY5PR07MB7251namp_--

