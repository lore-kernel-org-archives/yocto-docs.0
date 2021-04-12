Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web08.1527.1618252611551390707
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 11:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nNAzX477;
 spf=pass (domain: pelion.com, ip: 40.107.20.71, mailfrom: janne.kiiskila@pelion.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRWvaweVErY02WW8iWdu+Xn/fxC0Iej7Aus4CesSUI8=;
 b=nNAzX477w1EQooZ8YHfLy1k1UyDQLC8UO7scvHtGu5hTNtZNt0+EcBz6y13jGTruQo7m3laHeqwL+XG0L0sctfNA7QQZolqf5L70mBDXHY8O0CFzVfaEbed1eeHL2lc/fosNPFemhtBANV91ap1etJdJG42D9Ua8y/ju1njecdI=
Received: from DB6P193CA0008.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::18) by
 AM9PR08MB7103.eurprd08.prod.outlook.com (2603:10a6:20b:41d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 18:36:49 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::dd) by DB6P193CA0008.outlook.office365.com
 (2603:10a6:6:29::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 18:36:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=pelion.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=none
 action=none header.from=pelion.com;
Received-SPF: Fail (protection.outlook.com: domain of pelion.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 18:36:48 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90"); Mon, 12 Apr 2021 18:36:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d39708e895df3871
X-CR-MTA-TID: 64aa7808
Received: from 9dab5b153fbf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 82123455-0942-470B-A467-9CE873FF4C5A.1;
	Mon, 12 Apr 2021 18:36:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9dab5b153fbf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Apr 2021 18:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Df1uv+K7sfhuTIH5Kqv5Sv2HkWBoPTom4ay9mITonKwin8zd42t6PitBkaJ1BQKbtyhT1ruW/NQupMElB3Kkk7+l1PSPsXoF2B+MsuayBY+gUdqGeuZyi7VfaEcfF8+cAcrn+Ali4LoYkPFR9w3+T1j8hHtF6dEy+cpx2RWY/TWcQQI0iL+aYAvg4xL9MAliT26pX3G+jmYUZxW9IHbw4/jYZyXdD6tya4kyeKUKl342p10W1Swp/9wcXipvf4BVCs9z0LNdAv6xsVog8KFomkmocVE3bQwJLbaEJZoQBmlMlNH5nGdT0Amf4MM7XTGFCy4wtA501h3xtl+xXLL4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRWvaweVErY02WW8iWdu+Xn/fxC0Iej7Aus4CesSUI8=;
 b=RKTpL53Y99j+NBswY/0Y8JuK7+b8hBGmqJCyUZYU/+DYsymBgU+YBOO4PZQ3vw/wtCEOz4cQFw/dZf4dJvFZuARD0eeT/JtbN7gJf4IIP9mW7we2sWE0lrGNTffg4cOxdr3JiimxDQnPr3Pg4O1UZVSEyEgTrWzwNMr3k5EzGiQgyj6dYVLpviBzi4x1rqbdqMbiQdA8euMOwUqphwgAXLnLCEhnfm1+dA581C3ZMaP0ttYenViZWFqkl6N0nXLqmNii5sNECD6xuLOt9vczQNFjcHnGE5TEr4GKhEAKEAB1ez6wO75tS4SGti8p/+R7+/hUbVFJDnNPWLuCxWOK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pelion.com; dmarc=pass action=none header.from=pelion.com;
 dkim=pass header.d=pelion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRWvaweVErY02WW8iWdu+Xn/fxC0Iej7Aus4CesSUI8=;
 b=nNAzX477w1EQooZ8YHfLy1k1UyDQLC8UO7scvHtGu5hTNtZNt0+EcBz6y13jGTruQo7m3laHeqwL+XG0L0sctfNA7QQZolqf5L70mBDXHY8O0CFzVfaEbed1eeHL2lc/fosNPFemhtBANV91ap1etJdJG42D9Ua8y/ju1njecdI=
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19)
 by DBBPR08MB6252.eurprd08.prod.outlook.com (2603:10a6:10:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 18:36:39 +0000
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::a132:f2ac:2488:61c6]) by DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::a132:f2ac:2488:61c6%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 18:36:39 +0000
From: "Janne Kiiskila" <janne.kiiskila@pelion.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
Thread-Topic: [docs] [PATCH]Variables - WKS_FILE tip finding one used
Thread-Index: Adcvmdi1wy1ChyKVQCSzC3S7C+sWTwAK8McAAAEvaAA=
Date: Mon, 12 Apr 2021 18:36:39 +0000
Message-ID: 
 <DBAPR08MB55589379ADBC2F78977AF425F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
References: 
 <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
 <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
In-Reply-To: <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 301D98D7C1A8334E8E5EDC4F989ABC8B.0
x-checkrecipientchecked: true
Authentication-Results-Original: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=pelion.com;
x-originating-ip: [91.145.126.33]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: df11f275-cced-4e64-7161-08d8fde1eed4
x-ms-traffictypediagnostic: DBBPR08MB6252:|AM9PR08MB7103:
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB71033FB1331B37DC4B4011E1F3709@AM9PR08MB7103.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aiSAIwKWLdoyyqgqqH7OygDzBTf3Wr3QrYbWxxnZE2jsYuOcqHxEWnJptqHs00Cjz++w5Fab0DpIrtuC4oiz1TEkzshF8XhmUdjMWoRn8A7nPUmiO8xR2rOk1P3RQd0+d1nwTrulnx08sXO1CGLiqpwMSm/4vNz7jEA+TKj7V838uSWAvNH+LO0xRO3jTkbyfA/xF87qTUqifuHOApwiN3Z5ToU4RBWDcZfq5xx6wX/RwFaUv3flasuxYXXKqKcPkPBYF+uD+O5xaROjoD8zdUGAK/JFdo/s8hkOxAoJgsq2ePgDQ05b8XsV9fdY5kV+mlkx3o45SIkqa2siEWUrW2nSQEIzXyiDU/nlUpAwrt/7pIvca3grcGPaKIymSh+O5ZouMb3Y6yZN1GIIw/RyEV7zmtC1t98rrwM8PE/aPh+V/oB4be8khXY5OHvD0E09KFYdk5wojAXYHlU0OIjeaAhXvjrc0+mZm2ZDSunVTxh9AFZYFGpSeCepkppfBoeIeXXsklgV5SkY4qhvkOgubrrr2N1a0DYGmoXTMCZszHzwl3rn10c2KwWqoi96E0wRLRBF5FGo3HNSF5ez4+PIOOLgP08d8ZtotxjRsXcOjmlIcubeFDmiO+IolH00RUVoCePlDIeQ1q4VbDysJl32AI5pqRM5lXUZ60cyfktBa5ZCM0/avOMtCvrrP7BQ3Moq
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5558.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(45080400002)(9686003)(8676002)(99936003)(26005)(478600001)(71200400001)(53546011)(76116006)(5660300002)(33656002)(186003)(8936002)(38100700002)(66946007)(83380400001)(6506007)(2906002)(66556008)(66616009)(52536014)(66446008)(316002)(966005)(64756008)(110136005)(55016002)(86362001)(66476007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?wi40YSfCHO1v53EjOHdW6LFYyjRbaOiZz8omsA2QJehj726Vn5k0ksDt8F?=
 =?iso-8859-1?Q?Vk75j1XvimER1lS/8eXs8HccdTxVALZnE8axHRqeCKCGVggUoSpMUmiJfz?=
 =?iso-8859-1?Q?ztFuhNMlMTEjRIRvqK6lgoOqpyZFQaTqI4e3ltVNU4GS85tU/ZUP/S+SLg?=
 =?iso-8859-1?Q?7LEL7EqzLt8YLH8g/a1UwxF7KTlqTNhyoG+xDOf2/xzOgAMBeAdRP3Zqsr?=
 =?iso-8859-1?Q?+rMeirgk+q7WQhsHTreywsUozMtOzJbmdknwqY3rnOPtnLmcwP5RAEVDw1?=
 =?iso-8859-1?Q?NrR6vBgDrXmFuY9Av759iD067nu1jZNENfO2YUrHEqyurqlmNZ7kd8MuWd?=
 =?iso-8859-1?Q?ajGeLGef7x+RQ/zlGfqvMAGLpgo5jwjfyxFJJHKh4If3Y5tfJMLfVx2gK2?=
 =?iso-8859-1?Q?d0S1C6IB/HPUebBxaI6c6kvVOCz7NZR4+kiR/teA4xN2IRnV+yGkFiHUKd?=
 =?iso-8859-1?Q?d39ibT69juH9CnRmCoSrQtnrx0lzhs5qmgwl8psU+14YLFvHMnXwZU3usl?=
 =?iso-8859-1?Q?4dHAZqC/LL9RArCHUs0WSLKILQe1pgP3E/2cJzugaAFGCYCCztcvafbidn?=
 =?iso-8859-1?Q?yIIee/FArK9I5n7/7hOq+eJJ2FEW+/kaqrKes0QKAKAJyxHuQUW57ijYNb?=
 =?iso-8859-1?Q?CLXKhf+zBWGFon5c6xslTTwX4GLOyfFPB6DshdQOsO9vdXceEForqr8svy?=
 =?iso-8859-1?Q?WelFxMVPxU8psud+veT9h2LSqTTCbZwPi/OnakmKgJSDbygo2qozUhxMuA?=
 =?iso-8859-1?Q?g63gqw1N5gRA1mq9kINBYIoWK58MoGQBtguOyfiQZejgA/v87Ts9K8Gqp0?=
 =?iso-8859-1?Q?oHttCLRixL2wX4mZnyHpu3kuNcwQpz+fg+OdIVy/e5pwT1aZ5r/mbIZi6R?=
 =?iso-8859-1?Q?j/Kw6iqhLSnEwP664dIJKk8+0vuZhXwV7IIlyIyKnB9aur3qCmrkDXpz43?=
 =?iso-8859-1?Q?C/BfSVaSV/T4G8cytWd+uQrgAx/Bvn2HOeTVjn/uV28GD6+Y+kRxSm3G6m?=
 =?iso-8859-1?Q?6h7YkyLFk6rJnlhYjKcYR2Bn+9WPkI7kvHxJ7S+5kpQUgpxtK8lG1iWvit?=
 =?iso-8859-1?Q?DqUTkw3RPHtDGrvDtg5UK2AAeOYsnyF5J2zEAfRHHhQ+dF4DY/DPq4kdxR?=
 =?iso-8859-1?Q?K/HGPT90lCqFEaDADZbhufCA2n2H2lVRGyCNeGzcNiSdONpkzUIoxW6+Fy?=
 =?iso-8859-1?Q?FRcNdLyE2KK6Kc/s1CijVw399e3th0vHByrjuJ6B3QrbGgFM0+WKwjPqzX?=
 =?iso-8859-1?Q?sLl10PqXelvZooUNiW02kLoXa10zefZF4hagd3JaOTgwkijT/n5lLIPI0p?=
 =?iso-8859-1?Q?fEs2jWQzRl71cGSpeymvNr0eYu6Ag24qqkxA5vHrDXBGHY5P+4yMxw5sAE?=
 =?iso-8859-1?Q?zTRvhX4kjg?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6252
Original-Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=pelion.com;
Return-Path: Janne.Kiiskila@pelion.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	abd5abcc-c3dc-464e-346d-08d8fde1e933
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XBQ8pNqLe4Dfw9NcuV2NYsfZDBSI68VUqnMLGg/k18DBjoMUX2qH2Vb/oc8i8+OfDnsZh1WiQo36Q0+POFWDfl3z0nfHiTDZs9XnFoKNT+iFOovY5wPYwZn1y/BozaYrs/cQf/XnzzsDzM3UxvSo52f7nXTv6L0r2TTOk7QYO8QoSbZqjFpW2a6tWtZdCQGJe7IVDoHoS9ZEhkNz8yFBDV7mSlDbiO7qN0+UBKes0v9wstLapkNeVnGTAW/S2kub1giDQbadZsWgbJwQ/gWeLAfoX9OdJjYMUcaEw0pmfXC/eYRRRuMXemlEcGj/i37oGZZx1U5vbypVofCGUlTXYccb6QPzp8lUw61brQQSdaFkd/EKe8AGXoVSiYTcakn5KACrdh/uU0213WlKiL1LGGaSyX5PY6LmBogNyNcTlK2Z8ecT+SFzZLnb7ykHg9daSnvm9HVz3Hh2kWFwIIpjJ2UGgpk/iW3MoBsXtlzVLWe7eowHvOiVvjR4cZ3ibDJMyh41uGGP3Qtm7i175kDByQPBKcws/IbEgxY/moSWN9T/OHwxBhYrJcgtTm7S/g+vxupo1W4cA1frFejYZL1+T8XXbOM47aPFkFvrRWmZu/wYMuEf6LABL+iJQQMyMZls4ICUB2KXBeBGFX50Vd2yQpixoo9xygsUjtpciTahvQt8kWvOIjmAamTmi4ssaFtYAIQzReDJpPJpeX/4Qa6b5JSbhe2YkDLvkRIagRJ7occ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(45080400002)(356005)(99936003)(966005)(9686003)(70586007)(36860700001)(186003)(70206006)(83380400001)(86362001)(82310400003)(110136005)(6506007)(235185007)(2906002)(8676002)(81166007)(52536014)(26005)(82740400003)(336012)(478600001)(47076005)(316002)(7696005)(66616009)(53546011)(55016002)(5660300002)(8936002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: pelion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 18:36:48.9224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df11f275-cced-4e64-7161-08d8fde1eed4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7103
X-Groupsio-MsgNum: 1043
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_DBAPR08MB55589379ADBC2F78977AF425F3709DBAPR08MB5558eurp_"

--_002_DBAPR08MB55589379ADBC2F78977AF425F3709DBAPR08MB5558eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hei,

It is (unfortunately) amazing how wrong emails can still get things, so wha=
t I have here in MS Outlook the response is actually nearly unreadable.
Outlook manages to get in some strange extra characters there -  =EF=BF=BD=
=EF=BF=BD $ bitbake -e | grep ^WKS_FILE=3D

I am now assuming, based on what I read via the web-interface at https://li=
sts.yoctoproject.org/g/docs/topic/patch_variables_wks_file/82036822?p=3D,,,=
20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,82036822
That it actually means:

    ::

    $ bitbake -e | grep ^WKS_FILE=3D

I have updated the patch accordingly, attaching the new version of that her=
e and also including it in text format for (hopefully) quicker/readable rev=
iews.


From 5d6b91efb1b024146fe57d02b7cf289afc57509c Mon Sep 17 00:00:00 2001
From: Janne Kiiskila <janne.kiiskila@pelion.com>
Date: Mon, 12 Apr 2021 15:38:31 +0300
Subject: [PATCH] Variables - WKS_FILE tip finding WKS_FILE used

Adding tip on how to find the WKS_FILE being used in the build.
This information found from a StackOverflow article:

https://stackoverflow.com/questions/49912475/adding-a-partition-in-yocto-ge=
nerated-image

provided by "Nayfe".

Updated version based on feedback from Michael Opdenacker.

Signed-off-by: Janne Kiiskila <janne.kiiskila@pelion.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 19f5e34c58..392f9de391 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8794,6 +8794,11 @@ system and gives an overview of their function and c=
ontents.
       section in the Yocto Project Development Tasks Manual. For details o=
n
       the kickstart file format, see the ":doc:`/ref-manual/kickstart`" Ch=
apter.

+      To find out which WKS_FILE your build is using, you can run
+      ::
+
+      $ bitbake -e | grep ^WKS_FILE=3D
+
    :term:`WKS_FILE_DEPENDS`
       When placed in the recipe that builds your image, this variable list=
s
       build-time dependencies. The ``WKS_FILE_DEPENDS`` variable is only
--
2.17.1


-----Original Message-----
From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf O=
f Michael Opdenacker via lists.yoctoproject.org
Sent: maanantai 12. huhtikuuta 2021 21.00
To: Janne Kiiskila <Janne.Kiiskila@pelion.com>; docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used

Hi Janne,

On 4/12/21 2:48 PM, Janne Kiiskila wrote:
>
> =EF=BF=BD
>
> Adding tip on how to find the WKS_FILE being used in the build.
>
> This information found from a StackOverflow article:
>
> =EF=BF=BD
>
> https://stackoverflow.com/questions/49912475/adding-a-partition-in-yoc
> to-generated-image
> <https://stackoverflow.com/questions/49912475/adding-a-partition-in-yo
> cto-generated-image>
>
> =EF=BF=BD
>
> provided by "Nayfe".
>
> =EF=BF=BD
>
> Attaching the patch as an attachment, since it seems Microsoft Outlook
> does something naughty with the whitespaces and thus corrupts the patch.
>

Thanks for the patch anyway! Next time you may actually include your patch =
both as an inline attachment, so that people can comment on the patch conte=
nts, and as a regular attachment so that I can apply the patch.

I have a small improvement to suggest in your patch. Here it is:

diff --git a/documentation/ref-manual/variables.rst
b/documentation/ref-manual/variables.rst
index 19f5e34c58..f083f77f95 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8794,6 +8794,9 @@ system and gives an overview of their function and co=
ntents.
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD section in the Yocto=
 Project Development Tasks Manual. For details on =EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD the kickstart file format, see the ":doc:`/r=
ef-manual/kickstart`"
Chapter.
=EF=BF=BD
+=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD To find out which WKS_FILE y=
our build is using, you can
+run =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ``bitbake -e |grep "^WKS=
_FILE=3D"``
+
=EF=BF=BD=EF=BF=BD=EF=BF=BD :term:`WKS_FILE_DEPENDS`
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD When placed in the r=
ecipe that builds your image, this variable lists =EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD build-time dependencies. The ``WKS_FILE_DEPE=
NDS`` variable is only
--
2.17.1


Instead, I would just use (note the added space after the pipe, and the
removed double quotes):

bitbake -e | grep ^WKS_FILE=3D

At least, this would be consistent with a similar line in another manual:

documentation/dev-manual/common-tasks.rst:=EF=BF=BD=EF=BF=BD $ bitbake -e b=
asename |
grep ^WORKDIR=3D

Actually, still for consistency with this file (and with the majority of
other manuals), you could even write:

::

=EF=BF=BD=EF=BF=BD $ bitbake -e | grep ^WKS_FILE=3D

If you agree, would you mind re-sending an update, please?

Thanks again,

Michael.

--
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_002_DBAPR08MB55589379ADBC2F78977AF425F3709DBAPR08MB5558eurp_
Content-Type: application/octet-stream;
	name="0001-Variables-WKS_FILE-tip-finding-WKS_FILE-used.patch"
Content-Description: 0001-Variables-WKS_FILE-tip-finding-WKS_FILE-used.patch
Content-Disposition: attachment;
	filename="0001-Variables-WKS_FILE-tip-finding-WKS_FILE-used.patch";
	size=1434; creation-date="Mon, 12 Apr 2021 18:35:00 GMT";
	modification-date="Mon, 12 Apr 2021 18:35:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1ZDZiOTFlZmIxYjAyNDE0NmZlNTdkMDJiN2NmMjg5YWZjNTc1MDljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW5uZSBLaWlza2lsYSA8amFubmUua2lpc2tpbGFAcGVsaW9u
LmNvbT4KRGF0ZTogTW9uLCAxMiBBcHIgMjAyMSAxNTozODozMSArMDMwMApTdWJqZWN0OiBbUEFU
Q0hdIFZhcmlhYmxlcyAtIFdLU19GSUxFIHRpcCBmaW5kaW5nIFdLU19GSUxFIHVzZWQKCkFkZGlu
ZyB0aXAgb24gaG93IHRvIGZpbmQgdGhlIFdLU19GSUxFIGJlaW5nIHVzZWQgaW4gdGhlIGJ1aWxk
LgpUaGlzIGluZm9ybWF0aW9uIGZvdW5kIGZyb20gYSBTdGFja092ZXJmbG93IGFydGljbGU6Cgpo
dHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy80OTkxMjQ3NS9hZGRpbmctYS1wYXJ0
aXRpb24taW4teW9jdG8tZ2VuZXJhdGVkLWltYWdlCgpwcm92aWRlZCBieSAiTmF5ZmUiLgoKVXBk
YXRlZCB2ZXJzaW9uIGJhc2VkIG9uIGZlZWRiYWNrIGZyb20gTWljaGFlbCBPcGRlbmFja2VyLgoK
U2lnbmVkLW9mZi1ieTogSmFubmUgS2lpc2tpbGEgPGphbm5lLmtpaXNraWxhQHBlbGlvbi5jb20+
Ci0tLQogZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgfCA1ICsrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlv
bi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFy
aWFibGVzLnJzdAppbmRleCAxOWY1ZTM0YzU4Li4zOTJmOWRlMzkxIDEwMDY0NAotLS0gYS9kb2N1
bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdAorKysgYi9kb2N1bWVudGF0aW9uL3Jl
Zi1tYW51YWwvdmFyaWFibGVzLnJzdApAQCAtODc5NCw2ICs4Nzk0LDExIEBAIHN5c3RlbSBhbmQg
Z2l2ZXMgYW4gb3ZlcnZpZXcgb2YgdGhlaXIgZnVuY3Rpb24gYW5kIGNvbnRlbnRzLgogICAgICAg
c2VjdGlvbiBpbiB0aGUgWW9jdG8gUHJvamVjdCBEZXZlbG9wbWVudCBUYXNrcyBNYW51YWwuIEZv
ciBkZXRhaWxzIG9uCiAgICAgICB0aGUga2lja3N0YXJ0IGZpbGUgZm9ybWF0LCBzZWUgdGhlICI6
ZG9jOmAvcmVmLW1hbnVhbC9raWNrc3RhcnRgIiBDaGFwdGVyLgogCisgICAgICBUbyBmaW5kIG91
dCB3aGljaCBXS1NfRklMRSB5b3VyIGJ1aWxkIGlzIHVzaW5nLCB5b3UgY2FuIHJ1bgorICAgICAg
OjoKKworICAgICAgJCBiaXRiYWtlIC1lIHwgZ3JlcCBeV0tTX0ZJTEU9CisKICAgIDp0ZXJtOmBX
S1NfRklMRV9ERVBFTkRTYAogICAgICAgV2hlbiBwbGFjZWQgaW4gdGhlIHJlY2lwZSB0aGF0IGJ1
aWxkcyB5b3VyIGltYWdlLCB0aGlzIHZhcmlhYmxlIGxpc3RzCiAgICAgICBidWlsZC10aW1lIGRl
cGVuZGVuY2llcy4gVGhlIGBgV0tTX0ZJTEVfREVQRU5EU2BgIHZhcmlhYmxlIGlzIG9ubHkKLS0g
CjIuMTcuMQoK

--_002_DBAPR08MB55589379ADBC2F78977AF425F3709DBAPR08MB5558eurp_--
