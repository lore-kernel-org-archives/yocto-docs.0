Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE8ECCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 21:38:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.70])
 by mx.groups.io with SMTP id smtpd.web10.8436.1760218678213025997
 for <docs@lists.yoctoproject.org>;
 Sat, 11 Oct 2025 14:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zQ6jLGqD;
 spf=pass (domain: siemens.com, ip: 40.107.130.70, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ca9xTdk6X9WRFNOrfHMBIcEUO92f5GfRFaYf+mKOrekBhcQBZhgzaa8YX74K6U7tCA/lPQERZnq1fmkF0aEJFenR2qruebCS44FS5j5IKFPqyAoefiQdOrgC1FQ8wLo9ymYL8G2GxWb70K9s5fjNwXXe2c0GTe6PHUB0F1UX5LeX3WeptB5oTGPOmrREfef4Kb5r6z8z00TFdEOPgfTIh8/xylP2LjXCo0pw8xYC3Jn3+yaM1fhtnpqfyED0DwrEMVmgTLITcVzUxt77YL8t94Ez5mLeuUkmQDP5XxyNDpZQLmMhJ4NuQAMBSS2wVy0e3bEU8xRIZe9iqvxWUuprHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcYbSFA/IT+8s09ZGQl093Lta6CFZ8nej8LTyu/Ox7I=;
 b=nSEhzLpmEg0sTc4uAJAnCL5tTp8bEST1I1+dm56Yuwwbq4tiHXedlMgbV2akl1rg6mnoWyQ/7tvsmvH6G0tZJxu90qzjTfcVhuwE+wiXI1qoqj/X366S6/l2fNXah5rDoUbi0MT15vd0C6/5Qz6q6WcCoOql4bGAWsqj2aLLyO9hi99/8E32mCAClN3mfUD3pB59IOhWfeiePa9RoOxmm+St3GZ1tO7MaP1A3lXr50gO02wMjUR5C0aXzrHtPs6wzUzRRBKyJDDkqkKyr11WcYEWDYAzxxnt7fVR7fNrDKZpiwxOOfieRw753jh/QRPBrrmvGI71R+jPq6ino6s4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcYbSFA/IT+8s09ZGQl093Lta6CFZ8nej8LTyu/Ox7I=;
 b=zQ6jLGqDRPyNNY+JqsDP6b6GwomMoNqW1fIg7R5M8sHCZE1qKc6X2t7Yt9OabzuhtKu4bwp9o6hCouZ/pdLYH/zPpzPjzluLCBGEqDeYnThW2cRzrKuE5XTUbGcW2isTu3pn/7cqFjFeq9tMOmeMfCfRP8F0vOfirF2JXlNXjIB+9V1lnFxRv2EHVgAMstmPdtRDIjrQ7FthZTwGSYRcrV2iEnSiAu/A+mgIo5aquYTrv/+s4NH246Ek8mscnuBMgDF7GFfVY40Q0fyYmJvUEGwlKNoEum7N5SogiOiqjX37y5/v2jB7ecMVRxt9uMloJaG/g+pd0y0YF5t8MVGuFg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB8918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:441::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 21:37:54 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 21:37:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>, Quentin Schulz
	<quentin.schulz@cherry.de>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] vulnerabilities: update nvdcve file name
Thread-Topic: [docs] [PATCH] vulnerabilities: update nvdcve file name
Thread-Index: AQHcFQbwHCuak5TkC0K19talfkv/abR+Ia0AgBegeMCAAAf4AIAn+jQw
Date: Sat, 11 Oct 2025 21:37:54 +0000
Message-ID: 
 <AS1PR10MB5697A8FD8430D87D4D7EB560FDECA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250824145316.1098911-1-peter.marko@siemens.com>
 <44868213-2ff2-44bf-89a6-48e1dc6d3b80@cherry.de>
 <AS1PR10MB569701155DB1D9EDD00A2C2BFD14A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DCU6DNL4T7FE.WWFG4H593ZJH@bootlin.com>
In-Reply-To: <DCU6DNL4T7FE.WWFG4H593ZJH@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=111bbe55-b0da-45a9-a1d1-39e78163d20f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-11T21:37:04Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB8918:EE_
x-ms-office365-filtering-correlation-id: ecfadeb3-bfd3-4cd5-37b6-08de090e700b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?L1dBaktpbkR6VjNWUzltKzRsK0hvNnZGNlNPVzZTb1BDOEtKbHpQY1BsWEVt?=
 =?utf-8?B?Q21pclJ4QmRiSFdJdmdGZGpORUVyTjhaZCtsL21pRHE0VHczbk1tcDJXQjVu?=
 =?utf-8?B?VFpTRmpwSnFDeE8wY21POGlqZzB1eU9XUDAxVlNITG5idEtkdUJwa3pKZVF5?=
 =?utf-8?B?c0c4TzNud0hyZEdaQmhoL2JQR0dvRi8xRWFvOEZka1dNVVhpekFXLzl5SkFM?=
 =?utf-8?B?S0RQQzA3SDk3dGFadWxCdFlrOHlsUTZBN3BmYzFXQmZ0WG96Qy9Gc3g0S1E3?=
 =?utf-8?B?YnZvTFhBWFBtRVNMTUlTMDc1YmpYQkx3R1Vlay9rcWQwNHVzN1dTOTlXT0cw?=
 =?utf-8?B?UGNQckJrYUxFLzdKYXF4cWV4Wi95N2Q3NHFEN3I2QUZSbHl5eC9Ib1BrOXFH?=
 =?utf-8?B?dnJLYjh0YVkxYm8ybUx1dldGR3B5SGxLaDJTN0UwQWVORG9peWZ1QVBESzBW?=
 =?utf-8?B?S01qa0kzWHhDcWd0UTJza3UwYmMvTTFSaFB4Sks4Y0NyVXRUU3llcDhieEZU?=
 =?utf-8?B?c2M4T1E3RUlscjQ5dncxQXRPbWRIdzgydDR1azZ3dUhhc20wNUhWSUhYZnE2?=
 =?utf-8?B?ODlWYnd3Y1czMW8xdUQrTTMvbFdlcWlqSmR3c3hZWnJTenAwdDREYlAvMytx?=
 =?utf-8?B?ZllpQ1duNnVsRDJ1MlN5eHZic3VtL2dKQUxZRWNTcFVzdEw3eDBUMUVvZlZk?=
 =?utf-8?B?S09oTDBSb2FRWlB5MVgvZFlmVm4vU1ZnNmk1eW5oQVQyb0loOUVFNFh6QkJi?=
 =?utf-8?B?SklNQ2lRdm5ubW1OMElrQ3lUcnJ2cTFlZ3J0SjZWWkJ5TlRuZXcvWVI5cmsr?=
 =?utf-8?B?TTVGSVRqOE5GeGhXczBiT1EvTlV4M1N6Zmp6UmNQSGRGalNpanowUXhhVnJQ?=
 =?utf-8?B?UXpFRFcxRnNqVmlESmxrMDdoNzhSOXJsNHhvN1AwRGhBbFEvOUlUdlV1NnNz?=
 =?utf-8?B?NGtFWTNxeVkyRkRQM1NzYzJzTDBTUk43SjAwYTNKejBjTHl1VjZjeFJsS05T?=
 =?utf-8?B?SlVWY2tuYzJaQW1XVldnY0w2QUNON1k0R3hZazBIR2hzZ3R3eU9UK0ROdzcz?=
 =?utf-8?B?QzkrcnVoSnhubVpJcmZGSEJucjV3MzMyMkl0S2czSFV4NHh0TGg3RkEzMjBi?=
 =?utf-8?B?QWx0TkxWV2pkYWJjMHNWcURodDcyUUpBOFRHVnRjZTh1RE9hQy8zT1NtWHNB?=
 =?utf-8?B?VU9Ob09uTXFvWDE5WEJ0NHhBaVVCNHRoTStFbjhtTFFOVFR5WWlJS3pnWTBK?=
 =?utf-8?B?NXhxM2liMC9ONHJOcjJ6bXlza2diZzB4aVpjM3hVaXJlcm5tZVZKMU5ObERO?=
 =?utf-8?B?VUgvV05rcy9FUmg1Z3UrL1YydDNOQXBmeFl6VTkrdkFRaUg1N042NzB4WVpD?=
 =?utf-8?B?WkJZNzRPVk9CZURFeHgvNmd2aDBHaDBjUTRJaWhOa3RXTnVnNW1iYVJXOGht?=
 =?utf-8?B?SWp2Y0ZmMi9ZaG1Pb1MrMHNtSzljUkZyenhjTGNES3ZoU2pJZkJOVlpzMzgy?=
 =?utf-8?B?UU5teC83NERYbmM0MlAxKzJzeFdhMSttOEhycHlNQjJvemRZZmdaY2d5a3Vp?=
 =?utf-8?B?UGtLaFNWRUZJZk1IVnI3RDFGSmpFT2xnVytVVUxJcEJ3Q0J2aXRZWkVUOGVQ?=
 =?utf-8?B?UFppdG5QaDA5Zk8wR3pqdCtQeE1wZG5ua0VvWElmVyt0a3gwQ29WM3BXRGRY?=
 =?utf-8?B?TEhvMWJpRlVOWkRQWTE1eDI5Tk12d0ZaYlo0Z3ZnaEpWNTZLQkxrUDZMSER0?=
 =?utf-8?B?Ymp5aHFtcjQzeUxEZUhTaUd4VzhUM1F2OGVUcHpCbDNnSE41anZKM0Ewd2lM?=
 =?utf-8?B?K0lYVnV3TkRjWVJMcU9PNFZncTEvMHpWNGtiMUZyQmFBSmIwWFdoZUowN005?=
 =?utf-8?B?RWZaV2JOY2cvSEpEcHR0UlppdVpFRWVDVldESEVjRDRDelJJaWg1R25vQSt4?=
 =?utf-8?B?SGhlbUFVTVJTcU9wKzBxYVBWZEhsQXAzRkdyNmF1MTE1Tzd0YkcrWlNqWDQw?=
 =?utf-8?B?b2YzT2RQQTRBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R2cxTEJwRnB4QXBJZ3krR2krNTVSdU14b3orMFEzRUxEalE1eXNTWlhpbnlx?=
 =?utf-8?B?UU44ZHNiRmtFOW5VVzh1WlVsd2tKcTlQWVRKeWUzeVEzS0Nyd240ZFJISllz?=
 =?utf-8?B?ZGpFZjk4YXRUSkZrUGZqZTR0bmtNWm12RzJ4b2pBTlg1YlFUa3h4WTVLQU1F?=
 =?utf-8?B?VWQ2aTFCcWtNZWt0UDVMWDB1c1FzbmVvaSt4UzJZODd2Rmptb0dNNmZ5SlEy?=
 =?utf-8?B?MlRENnhSY3hZWCsrUzNoZTZ1b0l2R1RvcVBsZThhbFFWYlBVY0FPMEpGZTIx?=
 =?utf-8?B?OUFLNlc2dldmLzcwMzFiUGVlUTc2NzcrZldxRkN2RXBWanF6QVlYZkRZUDIx?=
 =?utf-8?B?VzdKb09rWjVycGFob2tRbzFCL2doVTJRdXE1T1FIUGhETHF2M1E1WE0zZzhN?=
 =?utf-8?B?T1hjZkJUYXJVbmd1ZGxucktNUWd6Vlh3dzRNaDBTK3A4UE5lT0o2SWVRdzhV?=
 =?utf-8?B?V0pISHplRWdzbTNLUitIRXE3aVhUZC9mbWh2UmhtemI4YVVqOGhiUVlPVnVC?=
 =?utf-8?B?Q203MjM0RzJmYlJnR0xYcTNqSy9jcVl3Ykc4djlzQ05RSlBJSEFYTTl1SjVt?=
 =?utf-8?B?K0hiNzRJQ3duVnNYVnVWWDFJdnVONUlYZUgzS01MNzc4THZmc25MZ2tuZ25L?=
 =?utf-8?B?UlZWVGFQalBIZXUvZ3hyekVzS0RrV0xtQlg2cFJxWS9tNXFGcWpLdDFlRlJk?=
 =?utf-8?B?MWZ0RXNWZmNoRGFpQVY1RjhVRW5oK0VVZG5GUHNnS0pxZFFwanhHVEIzamxo?=
 =?utf-8?B?cXFsRWh3ck9YSlhqbHpzaVRNQWRydDAxaS80SmlxYzBLbU02aGhEdnExckdI?=
 =?utf-8?B?TVhNMmNEdjkyZ2ZGTDhZUFF1a2pvZG1WaHZpWGpldmhNTXlleTFidnpxS3FW?=
 =?utf-8?B?am85Z3psc01kYjlmQzYvTHZwaWFITEhVRkVZTHFZUHdvbUJPYW4xK0RNdTRJ?=
 =?utf-8?B?bllGRjQvVmJqQmxKZDc4T3pnNkJVTjBOcWVWRGRqS09WbWt1R0VXSmFzanF6?=
 =?utf-8?B?SXU3a2Mwbk5jOFhyQTluSzdManRtZEpvZ0pPeHZDREczMkxnSTJFaEg2OFFp?=
 =?utf-8?B?UmZyYWtPekNIUUZLZ3dIOHRPR2t3V1JlN25WRUI4SjRUSjljWVhpbEFsNnhj?=
 =?utf-8?B?UWlSNWFYaDJmVUZTNW1TZWZYTk9Na3l0WVZrS05vRUJYRCtzRzRmN21Qb0s2?=
 =?utf-8?B?ZVc3OGY3K3R2bzVzQkhaRUpFR08ybVc3NVMydk1UK1k3SXlFTWZFcGVMeVIv?=
 =?utf-8?B?czlRbnhVNjhZb3A4Q05yL1ZBTFUrNWhHOVNnaFFFWmhJQ2R6c05NZFl1VmRm?=
 =?utf-8?B?S0x5UjVRb0FMVUVaZndkOWtHdXB5WEpyaEhkY3VjbkpJRWtJc0x3Mnd3SDcv?=
 =?utf-8?B?TzdwNWprUks5d1FNRDlpQ3RXalpGSkJJZU1wN1F1amd4bnlkRzVIclRRM0dl?=
 =?utf-8?B?Qit5N3NPbWFHS1B2bklhd1JXV050QlhYVzNVNFRHU01QSGFOZXVwQmRSaHFR?=
 =?utf-8?B?VERtVENHKzk5MERGWEo0emFyaUdBSEF1WS9HRW4xZDJkakFlcWJOOUtrRXhk?=
 =?utf-8?B?T0RkcHdPWnlnUVVjeThXbkdubjhyL3YwRU5rSWVMSm80UmRiaGRZaWlRcTJ2?=
 =?utf-8?B?cU5pTlNxWEpHS1hmK016YThaNi9sOUM0bCtyb2cyOXpLV0xNQ2FGTmlnbVJO?=
 =?utf-8?B?VTN6NnZyeUtVMjNPbGpJZVUvem5NcTlhcEVjbkl2UjZYcE5nNS92cXFQcjcv?=
 =?utf-8?B?RSt6L0IrUjhEYXhrU1c0blRvQ2lYa24ydkxlUDkwV0luL20wTWQzejZiUENI?=
 =?utf-8?B?cXNtRkhxZlNNaWgxRHU3YXE3WG52M3JsT1FxTGgyOGRHZ3dhNDRoU1VhL1ZR?=
 =?utf-8?B?emNWdkxhSWgzMVk0YXdzaENicFZ3SndIRktrVmdLaktQQ3AycU5QY3ZjSU9i?=
 =?utf-8?B?dXpDRnpQcjlFU09SWm0wVys2WGVNNUhXajh4eGtXWVVsN3FNYzNFTVdEd0Rz?=
 =?utf-8?B?WUF3Z0ZjVTlaa1NWdW1nQ1ZHa3lJSCtaQ2pqL3pSZ2QwdXRVd0NRNXhNNlVO?=
 =?utf-8?B?ZWQwSUFTQ2dFRVZPY1RVTG9SMXc5UTVPdTUwbFFYbHhEZGFFa0xaMDhrZ3g1?=
 =?utf-8?Q?if0OX6Ujk91eUibqTZNw92Ou8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfadeb3-bfd3-4cd5-37b6-08de090e700b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2025 21:37:54.7024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H16TCpha+8RT21ZaAT8yb+39J6I4ch3P8R+yBjryjRWoJzx3ykOemJWyAyVsFqeaI4BfTKMZ3Pwqc5m5l8F55Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8918
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 11 Oct 2025 21:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7686

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b25pbiBHb2RhcmQg
PGFudG9uaW4uZ29kYXJkQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIg
MTYsIDIwMjUgMTM6MDcNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+OyBRdWVudGluDQo+IFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPjsgZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
ZG9jc10gW1BBVENIXSB2dWxuZXJhYmlsaXRpZXM6IHVwZGF0ZSBudmRjdmUgZmlsZSBuYW1lDQo+
IA0KPiBPbiBUdWUgU2VwIDE2LCAyMDI1IGF0IDEyOjM5IFBNIENFU1QsIFBldGVyIE1hcmtvIHZp
YSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IHdyb3RlOg0KPiA+IEhlbGxvLA0KPiA+DQo+ID4g
SSBqdXN0IHdhbnRlZCB0byBzYXkgdGhhdCBJJ20gYmFjayBmcm9tIHZhY2F0aW9uIGFuZCB3aWxs
IHRyeSB0byBzdWJtaXQgcGF0Y2hlcw0KPiBmb3IgTFRTIGJyYW5jaGVzIHN0aWxsIHRoaXMgd2Vl
ay4NCj4gDQo+IEkgYmFja3BvcnRlZCB0aGlzIHBhdGNoIHRvIHdhbG5hc2NhciwgYXMgcGFydCBv
ZiB0aGUgcHVsbCByZXF1ZXN0IGZyb20gRnJpZGF5DQo+IGxhc3Qgd2Vlay4NCj4gDQo+IEkgdGhp
bmsgeW91IGNvdWxkIHNlbmQgYSBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhlIG5ldyBmZXRjaGVyIG9u
IHNjYXJ0aGdhcCBpZiB5b3UNCj4gaGF2ZSB0aGUgdGltZS4NCg0KSSBoYXZlIG5vdyBzZW50IHBh
dGNoZXMgZm9yIHNjYXJ0aGdhcCBhbmQga2lya3N0b25lLg0KU29ycnkgZm9yIHRoZSBkZWxheS4N
Cg0KUGV0ZXINCg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gUmVnYXJkcywNCj4gQW50b25pbg0KPiAN
Cj4gLS0NCj4gQW50b25pbiBHb2RhcmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

