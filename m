Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web12.10013.1618388681159235639
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FDaKsHmi;
 spf=pass (domain: pelion.com, ip: 40.107.21.48, mailfrom: janne.kiiskila@pelion.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76mTfZ2Aj2fXg3/ySxL9eiYxLmanw8zHKaIHbuG6oe8=;
 b=FDaKsHmicfKYwSqSp3oXIaMnD7T8a2nBYqUY5kfDvN30IPfYfU1G+cFgop3Szt++6WUYkTGxz+bWAikeOB1//6SwkahCgtUwouitc0AbPiRQUpovWQr+CYysZM8YILtQNlGnhOIUojSYpxhmp46KiqslbWLbzLzAPJ5ZL+3/8Qw=
Received: from AM5PR0402CA0004.eurprd04.prod.outlook.com
 (2603:10a6:203:90::14) by VI1PR0801MB1837.eurprd08.prod.outlook.com
 (2603:10a6:800:5a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 08:24:38 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::9) by AM5PR0402CA0004.outlook.office365.com
 (2603:10a6:203:90::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 08:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=pelion.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=none
 action=none header.from=pelion.com;
Received-SPF: Fail (protection.outlook.com: domain of pelion.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 08:24:37 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Wed, 14 Apr 2021 08:24:37 +0000
X-CR-MTA-TID: 64aa7808
Received: from 278430377afa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9E2B9968-7282-4855-BDD0-76D866858260.1;
	Wed, 14 Apr 2021 08:24:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 278430377afa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Apr 2021 08:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mR0LrLiu+eHM2Ng2Q54AveYEa3uM/uyzpmZaMTMLGxH0etxoKj6NSl0VsDDbQZlFtP+bfEI+zeJ5yn4A0vWFgLF8ZIvCXGlc3cVECa9TgabI2fA5FD+mnX7breYUqprqpMSCG1nATNrfic0oxazXnBCtoK4u8afvVKm8krvnDD6ulwLFZa3RacrpFpfiXrH+7Jww6f+DIwBoTkQ0aCrJEqafThCLBTMul7mHAMk67tOsicPXCxNKxFqI+bpyiSFfXk0VsKIoKCVswx9GhLJAU1OuTXE/4fdWBRAbADtpriIoFJZ9NaOtgujDji5Y2qcSVy5YFuns3WKEhTMMLs53+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76mTfZ2Aj2fXg3/ySxL9eiYxLmanw8zHKaIHbuG6oe8=;
 b=d49uEXuxN27jz+hPA6fIbwuAkskwbRy0Ln6YANuzLwMCSyTdxyNUgko3GxWdCzFVqamFBafgA34t2o92qel0//i4O8cWRYmS+z+WURo0wskgMZXltzXumxuFcyz0Er/ewwao8g9pWqE+zdL2d7ZloltlkLszr0U8t8vw99R4pkrEdUDBFO07SGzKCm5GG96vdq6lKSJHZt7fKcVM1ZMrgC8TcHuEpGBJDCuoXRjvl+ugPFCsjnSA7e+aNFfbCl14vgzx2NQ1Gur98bQcM7a6947nIqZPzMM3W/18uiMBSYbSBxkqbhjPqp8zjv7w9FIzZ2sr4cc/jOWs/xEIAqVTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pelion.com; dmarc=pass action=none header.from=pelion.com;
 dkim=pass header.d=pelion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76mTfZ2Aj2fXg3/ySxL9eiYxLmanw8zHKaIHbuG6oe8=;
 b=FDaKsHmicfKYwSqSp3oXIaMnD7T8a2nBYqUY5kfDvN30IPfYfU1G+cFgop3Szt++6WUYkTGxz+bWAikeOB1//6SwkahCgtUwouitc0AbPiRQUpovWQr+CYysZM8YILtQNlGnhOIUojSYpxhmp46KiqslbWLbzLzAPJ5ZL+3/8Qw=
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19)
 by DBAPR08MB5589.eurprd08.prod.outlook.com (2603:10a6:10:1a2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 08:24:24 +0000
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::a132:f2ac:2488:61c6]) by DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::a132:f2ac:2488:61c6%7]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 08:24:24 +0000
From: "Janne Kiiskila" <janne.kiiskila@pelion.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Michael Opdenacker
	<michael.opdenacker@bootlin.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
Thread-Topic: [docs] [PATCH]Variables - WKS_FILE tip finding one used
Thread-Index: Adcvmdi1wy1ChyKVQCSzC3S7C+sWTwAK8McAACCXm4AAExqQgAACLZqAABp86WA=
Date: Wed, 14 Apr 2021 08:24:24 +0000
Message-ID: 
 <DBAPR08MB55582E0BF19959FA9724ED35F34E9@DBAPR08MB5558.eurprd08.prod.outlook.com>
References: 
 <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
	 <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
	 <4788fc62-112d-b2cb-2292-e87a6282a214@crashcourse.ca>
	 <3b3e763c-7e0b-611d-2b45-2c917aaa0537@bootlin.com>
 <874e8b4d36e7febe5198c7ce04d692633c699aea.camel@linuxfoundation.org>
In-Reply-To: 
 <874e8b4d36e7febe5198c7ce04d692633c699aea.camel@linuxfoundation.org>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: A35955BE380AF34E8AE395FFD53349CB.0
x-checkrecipientchecked: true
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=pelion.com;
x-originating-ip: [91.145.126.33]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5686becc-361a-41b0-8258-08d8ff1ebe15
x-ms-traffictypediagnostic: DBAPR08MB5589:|VI1PR0801MB1837:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB18373686123E9A4DB779B242F34E9@VI1PR0801MB1837.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AaA8+ieB2KpcDLna3mgwWNdDfG5Zek6M6idDRFA9NDUda0352NrYMmVsQrhAR2yFbnQOkWJPeWB+yGDbExWSsrVd6W+Lht6fjHbVStiwqX/tFzjM2tGQzKEy0pJWiJXrQqHCZefBJ9xKtFNwq59lFjvwGD1i/12JSvkvbE1pcVDpfEpnnKqenwIh+g0FNmnLOztu8jrVc1HAlOlIGAq7QbCeaeU3TRBRV/Lh7u83yIkW8yzEsxAquXf8mH8WMgz0Kc288pbF1KlRwz7iv4+/NLl1CI0/4pA/cwmgDBtNhaM48FYY9B8B3P6Y3vp+fwds/b9Ju8iPHHM+MeJgyRq2OFY+6vtajiJ2iU880/b3t2cNTaUVXeZCvsAblL8sbdN+9vJzAmIdWRRZCh3IZ3b0q+ycMDPNALcpM7qF2wF8DrYaqVvv7iwt6p0E619rEspvd3cWtVWL4jsZXGEmgNc+XeYysCkefLPXgva8lW4LaEMtiMd1BEoHicQa7FgAr3h9kSq9wPk7BX58mPv4UeDQVYOhumhmhH9TgiK78RP3XVOitiLmI0+n0XxqvulNg6z19E4tfK8mhG+SEPovf9wOZggPWrlXJeW8AwImH/XFLMw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5558.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(66946007)(76116006)(186003)(110136005)(2906002)(86362001)(71200400001)(38100700002)(26005)(83380400001)(64756008)(6506007)(122000001)(53546011)(478600001)(4326008)(9686003)(66476007)(52536014)(5660300002)(33656002)(8936002)(66556008)(8676002)(66446008)(316002)(7696005)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?T3hxN1V3emNRZ3d5TDZWQVQ2NzBsT2pIck12SG5SZVFWYkZGZ0NwWmpVbkd0?=
 =?utf-8?B?TkNVU0t5dnZtUUNKaFVOS2o3UzNyVmJqYzRxSUUyWXdFdzFOTElwbjNGTFJN?=
 =?utf-8?B?NXRCQ3hmcmNqeWdRUDN3TFliTWd1WmVyRklCUW9VSDBjK2ZFczdOUmZEcEZt?=
 =?utf-8?B?MTRudXBaMDV1K2RjNTg1WWF0ZnFDVkIya2lpV2ZQVjVDZkUwYm1Ka0VQQ3lE?=
 =?utf-8?B?TDNCZEZyZXRUL1kwM2pJYW5iZThnSzF4cHBjTkwyUE5rcFpLT2Frak1uUWdp?=
 =?utf-8?B?clBYNyt2ZFZNN0pOUkwrZHpjVXpKVEFLckY2RTZwRWRNckVTZ3hsTXNicitW?=
 =?utf-8?B?NjlxakR3eFRqWHRFQmVHbzRpcHJnNndHYmFPQlRuT1VZUXpHM3g3dEJuODhZ?=
 =?utf-8?B?RlJaVkM5NCt3dnF5YzNnMm5NemxDb2s1V2cyRlVtYWNRcVFwb2xwdjVkRWtJ?=
 =?utf-8?B?VlVYU2I2TVh2WGcrNEhtVGZ6MVRvdkpIdE5xNk9DWmZUNmFhM01WWStBR0Rn?=
 =?utf-8?B?VEVCM1orNmtDd2JVTlF5QVR3R3BYVjJORFF6K3FYS29QZTF6eFN3bW04RFdU?=
 =?utf-8?B?ek9QV0F3L2tzdDhobUhtSTFFeThMNnptU0FvNFdESTdlMzdHMFQ4TWFOT0Yv?=
 =?utf-8?B?LzRRaU5OOSt0RndwMlpld0lQV3plV2RPSzJQcGJMbkF0NW9tYVNGZnUyNU0x?=
 =?utf-8?B?M3RzV0owRTF3Qm54eU5ZTVNXT2JyNS8yMDk5Qnlad2FwK2ZNQ091Mk1SNHpI?=
 =?utf-8?B?VEovRFZHNGxiUVI3cWtSSkMwclNKd1BDN3JNc254dDRFVEwrU3N4N3QwQUV6?=
 =?utf-8?B?NGJTVDBqTTYrTDhYb2FWVmhIV29VT1dMZ3BEYysrRjRJNlNWUHd1UE9LS2xG?=
 =?utf-8?B?VXZWVUtjSVpwQW1Wa3B1clQ4MnpIVFZ2emdTNXAveUU0YjZScGMzRWVuSnRB?=
 =?utf-8?B?Z09aVGlCdFp0bkcxNGo0WnFkSHdBeDNZN1c1S0V4blY1S3krZkhCK0ZzNmRn?=
 =?utf-8?B?Z0lzYnpFT002aDlPTGJSZzZSb2JUQnV5alR6cHBFTjZ5Y1duMSttVGdWZi9p?=
 =?utf-8?B?MWE2LzFWZzNKMkxOYyswSW8wejRSZFFWWDEwbjJFdzROVUtJZE1PeVUrUFJ4?=
 =?utf-8?B?bEFSK1ltN0N3akV2SXQ2UFAwb1dqblliNTJBcjBOUUIxUHdOMTZ0ZEZMYzc0?=
 =?utf-8?B?Y0ZnWndsSjRTNWNyb0tJbmJuNWgvSWZiaGhDS3RJZzZjRy9xcXZIRzdzZ0Fk?=
 =?utf-8?B?MnNlbkhmYzRzbzZsYXZ3bXJhM3p6ZTNHd1RidTlNcnY4SjNuVGt1RU5WZGRB?=
 =?utf-8?B?ZEFrcGFvc0tyempVTTI0ZlRLVWxBMUFrZmJFMlI3SU00MGFrcGdSWFZ6dllh?=
 =?utf-8?B?cjBvQjEzWHZOeWRRYno2TEp5UG5mQjlXQkxhT1czeUd3Z3I3QWdYM0RCUkZp?=
 =?utf-8?B?bXdtWHNFNGJDY0l6V1FEVjhoWHc1MkFYdWdIVE1obCtFdldxV2xJaTRKandl?=
 =?utf-8?B?YUdmK3dPVkN5aHczUzNYMVF4VldXVnRYeWs3ckZFdHFVbmQ3SFJRNStyS0VX?=
 =?utf-8?B?OHVDemRuaWFsZUtMcHRTZ1cxNDJ6aVFZblo4M0VyaXNvb1p5YWpXNmRPTHQv?=
 =?utf-8?B?VDVkR2VtYTcwNVNPdmpzUXVzd21vajdjRlZVdW9Ud2doVnRYRk1PSDZCR3Iy?=
 =?utf-8?B?dHhEUW5FUXFNY2lYNE5yamJZYUhlWHFDNDZ3N0ZXbGJJMjZzYWx1cWRMbUxO?=
 =?utf-8?Q?lShuGMP7wF0YTq+Wm1wyZYixMBqHY6b4L3orbnl?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5589
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=pelion.com;
Return-Path: Janne.Kiiskila@pelion.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9299fd5b-ea59-4d05-3aba-08d8ff1eb60f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HxzYF+T7AG00o9QBYzunWUl7EGZXufUz55XrHVuNkxDo577w2Y4x6kDKkYAvK7ve924KFzV4FUGwotI21ewYvUu8NljlO+IjVU7je3cKUewX/2mKj0WOYxkhaF6cLJEpDulCJgcjcIKrRxfT9iuaLTtE6ZGSTiQljtoZDDasP6LKo9FbcpaeFgjndBaI+P6ZZchDJI4S0Hm+CSjGjSq+oLfMV2L694eheXDN24is+RCAMlcijsfpcQTr+ejyme/rZmSo1+oVTDTgQilDYGJvb4uCMQWH7zRd29MvLBj0TsVDRiAwJvi877R+XCpV9HI6kFI4uVmHQgwzA/by55PtsW8xo+pQBWeiJrPizHK6JbyE/FDuyzSM71IN0/6hSeFz27vsMw0hEaxttBlfjmbqCVvWAM/1v1kLkUaeY4p9c0sWOxJzse6nbjvxAB4qUym0R6PgcSR1TJGzcCWCBoeXdFnr8nPOYBJ49zVuxRnRMR2NGXcezVPJ/ghPLoWE3eSnLe5Zipy4TXs9NX3hhYwD9HhS66o4Qr1ICNNciwwhN6SfJ/hGFJNFftYsFoy7qJOE9XxLW2lnKhxlcZklwYsNCdaYVKMnl26ytVd6m208U+ZJ4Md3wDXRCp68zoIrJ3HHVO6SLjy42S1DESEI1cDfEwj+KYGNv3r78nS38h0iN74=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(46966006)(36840700001)(2906002)(26005)(110136005)(47076005)(4326008)(186003)(5660300002)(8676002)(316002)(7696005)(83380400001)(86362001)(9686003)(70586007)(55016002)(33656002)(81166007)(70206006)(52536014)(8936002)(336012)(82310400003)(478600001)(6506007)(82740400003)(53546011)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: pelion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 08:24:37.4818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5686becc-361a-41b0-8258-08d8ff1ebe15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1837
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVpLA0KDQpGcm9tIG15IHBvaW50IG9mIHZpZXcgLSBJIHNwZW50IHNldmVyYWwgd2Vla3MgbGFz
dCB3ZWVrIGRlYnVnZ2luZyB0aGlzIGlzc3VlIGFuZCB0cmllZCB0byBsb29rIGl0IHVwIGZyb20g
dGhpcyBzcG90IGluIHRoZSBkb2NzLiBJIHRoaW5rIHlvdSBhbGwgaGF2ZSBnb29kIGludGVudGlv
bnMgaGVyZSBhbmQgdGhhdCdzIGFsbCBmaW5lIGFuZCBhZG1pcmFibGUuDQoNCkhvd2V2ZXIsIGlm
IHlvdSBkbyBub3QgaGF2ZSBhIGNsZWFyIGludGVudCB0byBxdWlja2x5IGRvIGFueSBvZiB0aGUg
YmVsb3cgbWVudGlvbmVkIGRvY3VtZW50cyAoYW5kIGl0IHNlZW1zIHdlIGFyZSBtaXNzaW5nIGEg
dG9vbCBhcyB3ZWxsKSAtIHRoZW4geW91J3JlIGp1c3Qgc3RhbGxpbmcuDQoNCldlIGNhbiBwdXQg
dGhpcyBpbiBhbmQgaGVscCBhIGZldyBtaXNlcmFibGUgcGVyc29ucyBpbiB0aGVpciBwYWluZnVs
IHJvYWQgd2l0aCBZb2N0byBOT1csIHJhdGhlciB0aGFuIC4uLiBzb21ldGltZSBpbiB0aGUgdW5j
ZXJ0YWluIGZ1dHVyZS4NCg0KSWYgd2UgZmluZCB0aGUgcGVyc29ucyB0byBkbyB0aGUgd29uZGVy
ZnVsIGRlc2lyZWQgc3RhdGUsIHRoZW4gaXQncyBlYXN5IGVub3VnaCB0byByZW1vdmUgdGhpcyBj
b21taXQgbGF0ZXIgb24gYW5kIGFkZCB0aGF0ICJHZW5lcmFsIGRlYnVnZ2luZyB0aXBzIiBzZWN0
aW9uIHRoYXQgdXNlcyB0aGF0IG5ldyB0b29sIGxhdGVyLg0KDQpCdXQsIHRoYXQncyBqdXN0IG15
IDI1IGNlbnRzLg0KDQpCZXN0IFJlZ2FyZHMsDQoNCg0KSmFubmUNCg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQpTZW50OiB0aWlzdGFpIDEzLiBodWh0aWt1dXRhIDIwMjEgMjIuNDIN
ClRvOiBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3BkZW5hY2tlckBib290bGluLmNvbT47
IFJvYmVydCBQLiBKLiBEYXkgPHJwamRheUBjcmFzaGNvdXJzZS5jYT4NCkNjOiBKYW5uZSBLaWlz
a2lsYSA8SmFubmUuS2lpc2tpbGFAcGVsaW9uLmNvbT47IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZw0KU3ViamVjdDogUmU6IFtkb2NzXSBbUEFUQ0hdVmFyaWFibGVzIC0gV0tTX0ZJTEUgdGlw
IGZpbmRpbmcgb25lIHVzZWQNCg0KT24gVHVlLCAyMDIxLTA0LTEzIGF0IDIwOjM5ICswMjAwLCBN
aWNoYWVsIE9wZGVuYWNrZXIgd3JvdGU6DQo+IEphbm5lLCBSb2JlcnQsDQo+DQo+IE9uIDQvMTMv
MjEgMTE6MzIgQU0sIFJvYmVydCBQLiBKLiBEYXkgd3JvdGU6DQo+ID4NCj4gPiAgIHdoaWxlIHRo
aXMgaXMgdW5kZW5pYWJseSB1c2VmdWwgaW5mb3JtYXRpb24sIHRoZSBzYW1lIHRpcCBjb3VsZCBi
ZQ0KPiA+IGFkZGVkIHRvIHByZXR0eSBtdWNoIGV2ZXJ5IHZhcmlhYmxlIGluIHRoZSB2YXJpYWJs
ZSBnbG9zc2FyeSwgc28gaSdtDQo+ID4gbm90IHN1cmUgd2Ugd2FudCB0byBzdGFydCBkb2luZyB0
aGF0OyBpIHRoaW5rIGl0IHdvdWxkIGJlIGZhciBtb3JlDQo+ID4gdXNlZnVsIHRvIG1ha2UgdGhp
cyBhIGdlbmVyYWwgaGludCBzb21ld2hlcmUuDQo+ID4NCj4gPiAgIGkgYWxzbyByZWNhbGwsIGZy
b20geWVhcnMgZ29uZSBieSwgdGhhdCBjaHJpcyBsYXJzb24gaGFkIGEgY29vbA0KPiA+IHV0aWxp
dHkgbmFtZWQgImJiIiB0aGF0IHdvdWxkIHNlYXJjaCBpbiBhICpwcm9wZXIqIHdheSBmb3IgdGhl
DQo+ID4gdmFsdWVzIG9mIHZhcmlhYmxlcyBieSBhY3R1YWxseSBkaWdnaW5nIGludG8gdGhlIGRh
dGEgZGljdGlvbmFyeSwNCj4gPiByYXRoZXIgdGhhbiB0aGUgY2xlYXJseSBoYWNraWVyIHdheSBv
ZiBncmVwJ2luZyB0aHJvdWdoIHRoZSBvdXRwdXQNCj4gPiBvZiAiYml0YmFrZSAtZSIuDQo+DQo+
DQo+IFRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24gYW5kIHJldmlldyAocmVzcGVjdGl2ZWx5
KS4NCj4NCj4gRG8gb3RoZXJzIGhhdmUgb3BpbmlvbnMgYWJvdXQgc3VjaCBhIGNoYW5nZT8gSXQg
d291bGQgaGVscCB0byBtYWtlIGENCj4gZGVjaXNpb24uLi4NCj4NCj4gVGhhbmtzIGluIGFkdmFu
Y2UgZm9yIGp1bXBpbmcgaW4uLi4NCg0KSSB0aGluayBpbmZvcm1hdGlvbiBvbiBsb29raW5nIGF0
IHRoZSB2YWx1ZSBvZiBhbnkgdmFyaWFibGUgc2hvdWxkIGJlIGRvY3VtZW50ZWQgY2VudHJhbGx5
L2dlbmVyaWNhbGx5IHJhdGhlciB0aGFuIG9uIGVhY2ggZW50cnkuDQoNCkFzIFJvYmVydCBtZW50
aW9ucywgdGhlcmUgd2FzIGEgbmljZSBiYiB1dGlsIHRoYXQgdXNlZCB0byBtYWtlIGl0IGVhc2ll
ciwgdGhlcmUgaXMgYWxzbyBhbiBvcGVuIGJ1ZyBmb3Igd3JpdGluZyBzdWNoIGEgdXRpbCB3aXRo
IHRoZSB0aW5mb2lsIEFQSSB3aGljaCB3b3VsZCBiZSB0aGUgbW9kZXJuIHdheSB0byBkbyBpdC4g
VGhhdCBzaG91bGRuJ3QgYmUgYSBodWdlIHRhc2sgYnV0IG5vYm9keSBoYXMgdGFrZW4gaXQgdXAg
eWV0Li4uDQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29u
dGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwg
YW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90
IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFu
eSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVt
LiBUaGFuayB5b3UuDQo=
