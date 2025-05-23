Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912C2C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 08:46:48 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.128])
 by mx.groups.io with SMTP id smtpd.web11.44032.1747990003664413862
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 01:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=eKDa4Nzk;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.128, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcuekWsqDtBuyO8ZYaEdnL7R4NrGwhASftQ+jhrWIqp5l3wZim7U6lajVLWKNA13ebl0Jv1kWm/RU49Fw2VyNrLXlP/qdqmpSf8aV2x+Gq3BdcSG596NyXzVsd03QI5GYOgveAtz2QPUqxgfdzdgy1ZtlE3EvHVeWn1kQ2o/8LQGpF4yZEn3/rEsQek0M6IQq3MFpD62/kVJGW9ruyXsvmcIigexQtJGihnE4GFmtoJlbEaXlLBG+M9E6DsSWmqScB96dGpAfVTiLUXDmH56J0kSoQexlsgQWZX/yY4/uH1uuoGAN1ttDX0FXN61mLSVcaDAvA4YbfbrafI52h24GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMydmRDfAk/lipmV5WKYi5ID+7AdYcILqqIJoSnghDo=;
 b=qiQYdUXMUyAdg+tvqiShiIB8TyPBzVVILmxqM0U+Xn0DngVhsMNf2e0K6EJSMgt9hwWx1sSQhon0WEd3/paPd/w6onRzlZiRllUC8I57ARwYyg/LfBbCHD1xe5IbfBU8Cxyvkk0xTPR+Eg21K+DQNVoJWhLtinZGVsXdHd4mA2N72YxJZGwe7HvpErZhcRTeDz4FaCr6Bff6iwx9qH8ozxvXfJYfJdJ1IXz77sjfzFNlVWNOGI7KMGLVcikwjuS+wxSmZKrCDBaZvM01Iiyim5qfDB+WA1JLtYa2QnBe65Do4GmFie3dZ62avy9OlJTAIT/JcOOv5pE/5gUE3ozmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMydmRDfAk/lipmV5WKYi5ID+7AdYcILqqIJoSnghDo=;
 b=eKDa4NzkmssPOmcU5+bT4hxpF3BffLRG5NMwCRh/zl8JpmBri0m+0TuLbP5G8gSr5adxE92586i+G/SF0RlEQuNhApeIf/aC+Fy3voLQmesFRXOpZ7LbzH6wOjczAG8SvKRnXKP5iwnL72fjyOd3L1F0cqPpky63Ajhv2RYPPM6gvSUbcnS0D5fTpJPAOfMooo4GFs52jAX++D1D9uSflx/ZZLPgLTpoRNMl8Xvt2w0/biGVZs/wsiw7+OFG34nUUIFGr0h5xyVa5dltimB3lDLiMZac+3LjElxPsrW2ccIJXTo9XzZqI+X2lh0HaBZpcis0SigP+hGERAnRw4gzlA==
Received: from SEYPR06MB5037.apcprd06.prod.outlook.com (2603:1096:101:51::5)
 by SEZPR06MB5713.apcprd06.prod.outlook.com (2603:1096:101:9d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 08:46:34 +0000
Received: from SEYPR06MB5037.apcprd06.prod.outlook.com
 ([fe80::7c38:ebde:a05c:8196]) by SEYPR06MB5037.apcprd06.prod.outlook.com
 ([fe80::7c38:ebde:a05c:8196%7]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 08:46:33 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [docs] [PATCH v1] ref-manual: uboot-sign: Support firmware
 property in FIT config
Thread-Topic: [docs] [PATCH v1] ref-manual: uboot-sign: Support firmware
 property in FIT config
Thread-Index: AQHbyW1EAaXEM/UtCECPmisvEGvnU7PeZq8AgAEG5gCAAGmAgIAAE4/g
Date: Fri, 23 May 2025 08:46:33 +0000
Message-ID: 
 <SEYPR06MB5037DBAF9F6292D18F0B12C5FC98A@SEYPR06MB5037.apcprd06.prod.outlook.com>
References: <20250520095457.3642012-1-jamin_lin@aspeedtech.com>
 <DA2L51D2Z4RJ.2MJEUG0QTSSXN@bootlin.com>
 <SEYPR06MB5037376466D185F30EEBA725FC98A@SEYPR06MB5037.apcprd06.prod.outlook.com>
 <DA3D6LHYFO0L.17LFD13QJ62YV@bootlin.com>
In-Reply-To: <DA3D6LHYFO0L.17LFD13QJ62YV@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5037:EE_|SEZPR06MB5713:EE_
x-ms-office365-filtering-correlation-id: 8535b1ac-2163-4b21-8972-08dd99d65226
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cVhCVTRUSHBTNTEySnVtOTVGelNkNWZ4NjNiSkZ0V0tsa3R0ZzJvQzF1Qnow?=
 =?utf-8?B?ZjRlZncralV4Y2dGbEROemMwenZ4bGt2MGtBd2p2QjdZQmdLUzAxd1AxU2Y5?=
 =?utf-8?B?VkVNMWN1MWRsMzN3eUlDcEsrNXpGcjlKdGdrT0xKM2Z4NUJyOEFRMVBvSzhI?=
 =?utf-8?B?Z1lDVnJGMWsrSmxEZ1pZWG44ZHJjVjVHb1ZyRkY0b0pmNVhaM3V5TE5nRysy?=
 =?utf-8?B?TEdKd2hiQUd3bkNBTFhJQjY1d1VCeDlyOHpUMDdDbm1TUU12SzRGK09GVXkz?=
 =?utf-8?B?THc2UTJXWEltYWpSZTQzYW93YjZ4Y3BlUW1XV3UyZE5lNU54TUZ1NzhTcEtp?=
 =?utf-8?B?UytOWERmYlYxRmhMSXF4d2creFM2NzdBdE4rdmYxS05jd2NUZEJ3YlBEcXE0?=
 =?utf-8?B?VnNLMms0di9UYTlNNnhzWjl5UCtJWGpvaFpjbDdhKzV3aEtVWkdqV1RjS0ND?=
 =?utf-8?B?WUUvSENURHBUL0lkd1NzWHoydURYYytUTUdxUlFkR1NBVVdVVVpsUUNFY0ww?=
 =?utf-8?B?UmZ6LytwRnQvdGQ0Qkpzcy9iamw0ampENGw4N3pnVWx3Rm96TVVOUmFjTWlD?=
 =?utf-8?B?b0phL3hDQ0VVUlNNeG9sSkZRVjZ5NVZZV2E3VTRZOVFwYXpmc1hvUTVjcGN5?=
 =?utf-8?B?dTBGL0JlTE9KYUx1NHlCeXlSaDhFWlVlc05ncFFlL2N5M2NteTloNjh4Tk1w?=
 =?utf-8?B?K1d2aWFiNmJnbVBlV3dDVXJDeWoyaTIxWm5xT0k1ZExDbGowTy9YV3k4bGww?=
 =?utf-8?B?VWtnZDdSLzRKOWhsVzV5R0trRmZrTjkwOGxuQ21OUyt1R0g4dVFwQWRHNkZ3?=
 =?utf-8?B?bEZ0TEV5eHNLUWE5M1JqZU85cnJ3cUFlZlNUU0UyQ3hJaE1IYzlvR2NWOExl?=
 =?utf-8?B?eGlUUDIxWXZxc0xrYU4vNFkyZzFpK3FEck5LSXd1bW1HODh5MFcwUTlnQmd5?=
 =?utf-8?B?YktLREJyT095R0w4amV6aDdQVnZjQ0oyR3hqTUtHUzUrMDJGYjJBQmFZQ0lI?=
 =?utf-8?B?V21SVUtDSzh4cjBlUWVZVEFJOTJGS25NQVBtRjhaMXNuOWtjM1FBWVV6SnVD?=
 =?utf-8?B?OEhzdXFVMEF0MHVPdGlHdHc4ZGV1dmFwSHNHdy9JTVhXVmhLb2MyV1hXNk9n?=
 =?utf-8?B?bWF1TzFJNXljb2NCMTBXRDNCMCtlWDBWTi9DTGxhZzJsZHVDUllma0dwUlFC?=
 =?utf-8?B?eGcxS0phVDdTMU0wZzkxeUJ1Q1FpNy9iUXZ6ckxVVkl2VkoramExdWxWVk4x?=
 =?utf-8?B?czVHNkN0NjFBakZtbzhVRUkzMXVjcmVqVitTTEdJckpRNHF2ZWV5UVd4Z1Nm?=
 =?utf-8?B?VFNrWjhlUTkycGtZc1RaV0VmOVRmU3p0UFhFQlRXdCtoSzlpSDhaNGhBUjIw?=
 =?utf-8?B?WnZteHNRRnlOMjVHMExvN3M4dVpnbW03T0NqTVk1VWpkYXB2QXRhSUR3ZnNG?=
 =?utf-8?B?OEZ3cEZUME1EbTlIK1dNRVM5R0xhYVhkUklEbjRYTEg0eE8vdTFFT0p3Zlo3?=
 =?utf-8?B?YnRmcnMyeUZZWllEWHIxUkVqN1plUEljNDQ3NHdVZ3h4ME1SRXNyOE5MQ0lQ?=
 =?utf-8?B?c2NBMW9kbi9wRXo3eDBnUFl4ZTdiNnZKd09vN3RLWHRuZUlnNXhJZXJsTHFi?=
 =?utf-8?B?SDJZdEpnMUw5TXFpL21mWk5OU1VYQVBSUkRiekJOWFYyZXhZT2NTMk50cXRW?=
 =?utf-8?B?MWpsTzdYdGlqcXhMM2RVc3hKbGRuVEZMcWJzRkd2RUxnVU1XeWNmVmZ3dUhK?=
 =?utf-8?B?YnV4RjZkYXQzSnJkWHdFQ29TaG1rdEdydUsxb0tHZXRMeFUyQ0loUWJRVm5x?=
 =?utf-8?B?MHRMZlZ6a3ArRnFHWWovVjVIL3VoenZjdVJ5WndPQjhqTTlJd2dPZU53SzBF?=
 =?utf-8?B?a1dHZWN1cEltZHlIM0JLREhsTnE4YnQrdlR6SG83T1cxTXNoSjJWMmU3dXI0?=
 =?utf-8?Q?M7zwOP5iIyc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5037.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SVA3cXJyV0krMkZZUDhRd25yWWgzNW1OK2dsY1YrYXVmTHdHSWtBdEdZMnFw?=
 =?utf-8?B?TGNaOGpVWjZJMEhaZTFmMk03L1VhYk1yZ1M5ZzFNdE8rQ0dPSkk2dkVRMFc4?=
 =?utf-8?B?WWE5ZXRMcGszZ2VYbWZzV0F0c1ltUTd1VkR2OXFEWUdRNHh5QTl0NFNzdzVy?=
 =?utf-8?B?QlpIRjQyVncweDFXVVpNbWFPZEE2SlcxRHZDU1ZYMk9RNnZpaGZiV1o1OGVY?=
 =?utf-8?B?NU1FcXl2MXlUc2NESVF0d2kwMXlmQVhvY3AvMVlRc3NlVmQ2L1NoNjJnalMy?=
 =?utf-8?B?OVMrM1daa0RNR25naUdHVjVhdUNtK0kwU1dKdXk0cGJka0ppdlhFUkhnekdH?=
 =?utf-8?B?NC9QNFIrWGhQNHpQUTBGM1ZVTHdqSXlXYkZqcys2N0tmbVZNaGwweE1iVUlF?=
 =?utf-8?B?b3RyVEZic0ZKSHZkY05ra2dXeHFSbHFZaFo4QjZFU212L1N4dFFvNHIwSnRM?=
 =?utf-8?B?T1ZHOFlQQzliMGVISDZKRHVBYXNhdnhoZHJYYnNWMElsZGt1NEhyNFozb1N1?=
 =?utf-8?B?Q3pFZ2VJcW1VV20wTDR5KzhaczY4ZC9OSjhqRkcyTENHQXNzK01kT3BEN1Ni?=
 =?utf-8?B?cmhCbTFVRkQ2MXZHZ0pBSm5iZVpWUHAxenFHOHFKbk1LMDNZSnZ2OFNUMEhy?=
 =?utf-8?B?OE5Dd21wWjVSN1pzNFFYb1UrQjlNQm03YWVYZ3h0Q2xhaEhxZmVxVTlERnIv?=
 =?utf-8?B?MGM3NFV2VVF4ZldpQWFOUkdqUkhVSjNha0tkYlhXdHRtUzQ3dWlYb1RGSXlE?=
 =?utf-8?B?K3JBSGJSeHh2OUFadGxPU1Y0UjNwbjZZT3FIRHpjN3RNa084RkhYeG9rY0NU?=
 =?utf-8?B?bUtoT29GSVZTdlAxdWROODc0SnB2NjFqSDJWMjFKL0RrdUYwVmg1WDBWa2xp?=
 =?utf-8?B?a3hjNW52aUJvSFdLb1pmYVZ6bk9tcFVKcDFyQWV3TUN2ZWFKdDhEN0s1cXJY?=
 =?utf-8?B?VERCVEhiUTBpd2dWK2N5elIzMnJZb0RNZ2hYaS9JZk8rMitjMzU5STNRdTNr?=
 =?utf-8?B?YXVpWmZiK2lOVTNia29NbmVBSXNnZjZiUGltTUJWdHU2ZUNkQU00czJ1bTVB?=
 =?utf-8?B?MlZSWkljSVFFczZIQnpCNWo3N2tHSVpDOXViRmcvYjN3UFQzUHB3THhqQzVX?=
 =?utf-8?B?Sk9mcytGU1BxbEREUWtlNmh3VERIT1lucmZWNWFjS3FQc2dzOHlqaW9BYnpi?=
 =?utf-8?B?SkEycmhGR08vcEZVWVdlQXI2c3h1b0ZkdHYwaXZUM0FHZkNyMTZIWkY4cnhi?=
 =?utf-8?B?aWNmWmpiQVJOV0c3MDFFc0lxcEQ0SGpnQzdVclMxTkRjTXlmZW1QSzVlNE1P?=
 =?utf-8?B?aVVTVGwvMHJ2OUxDRXBzdnVWbi95QjdWSXVNK0U4V2lHTUg3ZlhlZWpKN0xl?=
 =?utf-8?B?cnd5bjhhbkJ3QURkNHBWdXRMN2E5ZXZOUmNPQ3JvTEFFbHhsNDQ1T1NNZTcw?=
 =?utf-8?B?YWJMMDhuN3owSUhvMUh1SUNhSlRCYmkvcjVUNUthUDF6V0tkODMvWDZaTnhz?=
 =?utf-8?B?TXpUeUF3amJIZ2tiUVh6OEgyeE9nSjE0cXFpK2w1bTl4RzE3L2d0S3dwMHB2?=
 =?utf-8?B?NGVJRmR5YXkzREtWTHRvUnNQeEdlWHA4eDNhbmU3RHcwM3hTSUVUdU90NUQ0?=
 =?utf-8?B?bU5vQ2xZdlg2RFJBMVJnWDFaTmlkbjRIR25kdkJlNU9kL0Z2VEJ5aXl5Vm9t?=
 =?utf-8?B?NG80K1FKVGR3QnpFNk1zcGZtUFhnZjVOb2tSeWJSQXJaektxVjJsOVdrZXBo?=
 =?utf-8?B?L2crMUhOcnh6anc0alV1cjNSWUR0VlY0ZVQva3FYVEpGR2tGa1BWL2MxNVpX?=
 =?utf-8?B?RS93QWlnZnZBOGoyQWJMRlhRc0tTZnZHYVR3cTM3RGVIY3JFNEF3aktBYi9u?=
 =?utf-8?B?ekhMcFRodGxkUGRZUU9pdk1kakFabEdnZVpzMWpxMGtubjdCanp4ajl1NDgv?=
 =?utf-8?B?VTBVWVk3TlpsUlhBMVh3d2tTQ0hqbEVacnoxRW9sYmE0OWQ0cWM4QUpPOEFF?=
 =?utf-8?B?aWtPWGNUYWg0MWcyT29nQWVnZGN4SmdKZ0VjL3FZVEl5R1VGM2w3VHQzb3BK?=
 =?utf-8?B?OWdPUFNkcmJUWUFaZkw5aFdJcERpR3p3d0tqa2ovLzRZOXprRlpCNjhac3N5?=
 =?utf-8?Q?nNFiKK9zNAeieLWTZP92SE8b3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5037.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8535b1ac-2163-4b21-8972-08dd99d65226
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 08:46:33.6757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2cHHstzBCC6ic8Zehw1yh5zSP89+Pxe9rCGNz1/k58aB3IQGzfa6FbCBZlMehC2NCuGtJgh/q/NPCJ2dZt1qZE29U8k/Lh6z3/t2kCenEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5713
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 08:46:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6886

SGkgQW50b25pbg0KDQo+IFN1YmplY3Q6IFJlOiBbZG9jc10gW1BBVENIIHYxXSByZWYtbWFudWFs
OiB1Ym9vdC1zaWduOiBTdXBwb3J0IGZpcm13YXJlDQo+IHByb3BlcnR5IGluIEZJVCBjb25maWcN
Cj4gDQo+IE9uIEZyaSBNYXkgMjMsIDIwMjUgYXQgMzo0MCBBTSBDRVNULCBKYW1pbiBMaW4gd3Jv
dGU6DQo+ID4gSGkgQW50b25pbiwNCj4gPg0KPiA+PiBTdWJqZWN0OiBSZTogW2RvY3NdIFtQQVRD
SCB2MV0gcmVmLW1hbnVhbDogdWJvb3Qtc2lnbjogU3VwcG9ydA0KPiA+PiBmaXJtd2FyZSBwcm9w
ZXJ0eSBpbiBGSVQgY29uZmlnDQo+ID4+DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBPbiBUdWUgTWF5
IDIwLCAyMDI1IGF0IDExOjU0IEFNIENFU1QsIEphbWluIExpbiB2aWENCj4gPj4gbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZw0KPiA+PiB3cm90ZToNCj4gPj4gPiBBZGQgZG9jdW1lbnRhdGlvbiBmb3Ig
dGhlIFVCT09UX0ZJVF9DT05GX0ZJUk1XQVJFIHZhcmlhYmxlLA0KPiB3aGljaA0KPiA+PiA+IGFs
bG93cyB1c2VycyB0byBzcGVjaWZ5IGFuIGltYWdlIHRvIGJlIGFzc2lnbmVkIHRvIHRoZSAiZmly
bXdhcmUiDQo+ID4+ID4gcHJvcGVydHkgb2YgdGhlIEZJVCBjb25maWd1cmF0aW9uIG5vZGUuIFRo
aXMgZXhwbGljaXRseSBkZWZpbmVzIHRoZQ0KPiA+PiA+IHByaW1hcnkgaW1hZ2UgdG8gYm9vdCwg
aW5zdGVhZCBvZiByZWx5aW5nIG9uIHRoZSBmaXJzdCBlbnRyeSBpbiB0aGUNCj4gImxvYWRhYmxl
cyINCj4gPj4gbGlzdC4NCj4gPj4gPg0KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IEphbWluIExpbiA8
amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0KPiA+PiA+IC0tLQ0KPiA+PiA+ICBkb2N1bWVudGF0
aW9uL3JlZi1tYW51YWwvY2xhc3Nlcy5yc3QgICB8IDIgKysNCj4gPj4gPiAgZG9jdW1lbnRhdGlv
bi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgfCA4ICsrKysrKysrDQo+ID4+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+PiA+DQo+ID4+ID4gZGlmZiAtLWdpdCBhL2Rv
Y3VtZW50YXRpb24vcmVmLW1hbnVhbC9jbGFzc2VzLnJzdA0KPiA+PiA+IGIvZG9jdW1lbnRhdGlv
bi9yZWYtbWFudWFsL2NsYXNzZXMucnN0DQo+ID4+ID4gaW5kZXggNTE4NzAzM2Y3Li41NGE5OGJm
MjQgMTAwNjQ0DQo+ID4+ID4gLS0tIGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL2NsYXNzZXMu
cnN0DQo+ID4+ID4gKysrIGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL2NsYXNzZXMucnN0DQo+
ID4+ID4gQEAgLTM0MjYsNiArMzQyNiw4IEBAIFRoZSB2YXJpYWJsZXMgdXNlZCBieSB0aGlzIGNs
YXNzIGFyZToNCj4gPj4gPiAgLSAgOnRlcm06YFVCT09UX0ZJVF9VU0VSX1NFVFRJTkdTYDogYWRk
cyBhIHVzZXItc3BlY2lmaWMgc25pcHBldA0KPiA+PiA+IHRvIHRoZQ0KPiA+PiBVLUJvb3QNCj4g
Pj4gPiAgICAgSW1hZ2UgVHJlZSBTb3VyY2UgKElUUykuIFVzZXJzIGNhbiBpbmNsdWRlIHRoZWly
IGN1c3RvbSBVLUJvb3QNCj4gPj4gPiBJbWFnZQ0KPiA+PiBUcmVlDQo+ID4+ID4gICAgIFNvdXJj
ZSAoSVRTKSBzbmlwcGV0IGluIHRoaXMgdmFyaWFibGUuDQo+ID4+ID4gKy0gIDp0ZXJtOmBVQk9P
VF9GSVRfQ09ORl9GSVJNV0FSRWA6IGFkZHMgb25lIGltYWdlIHRvIHRoZQ0KPiA+PiBgYGZpcm13
YXJlYGAgcHJvcGVydHkNCj4gPj4gPiArICAgb2YgdGhlIGNvbmZpZ3VyYXRpb24gbm9kZS4NCj4g
Pj4gPiAgLSAgOnRlcm06YFVCT09UX0ZJVF9DT05GX1VTRVJfTE9BREFCTEVTYDogYWRkcyBvbmUg
b3IgbW9yZQ0KPiA+PiB1c2VyLWRlZmluZWQgaW1hZ2VzDQo+ID4+ID4gICAgIHRvIHRoZSBgYGxv
YWRhYmxlc2BgIHByb3BlcnR5IG9mIHRoZSBjb25maWd1cmF0aW9uIG5vZGUuDQo+ID4+ID4NCj4g
Pj4gPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QN
Cj4gPj4gPiBiL2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0DQo+ID4+ID4g
aW5kZXggNjQzYTNlN2FlLi5iNDMwZmE1MWYgMTAwNjQ0DQo+ID4+ID4gLS0tIGEvZG9jdW1lbnRh
dGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4gPj4gPiArKysgYi9kb2N1bWVudGF0aW9u
L3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdA0KPiA+PiA+IEBAIC0xMDMyNyw2ICsxMDMyNywxNCBA
QCBzeXN0ZW0gYW5kIGdpdmVzIGFuIG92ZXJ2aWV3IG9mIHRoZWlyDQo+ID4+ID4gZnVuY3Rpb24N
Cj4gPj4gYW5kIGNvbnRlbnRzLg0KPiA+PiA+DQo+ID4+ID4gICAgICAgICAgIGRvX2NvbXBpbGVb
ZGVwZW5kc10gKz0gInRydXN0ZWQtZmlybXdhcmUtYTpkb19kZXBsb3kiDQo+ID4+ID4NCj4gPj4g
PiArICAgOnRlcm06YFVCT09UX0ZJVF9DT05GX0ZJUk1XQVJFYA0KPiA+PiA+ICsgICAgICBBZGRz
IG9uZSBpbWFnZSB0byB0aGUgYGBmaXJtd2FyZWBgIHByb3BlcnR5IG9mIHRoZQ0KPiA+PiA+ICsg
Y29uZmlndXJhdGlvbg0KPiA+PiBub2RlDQo+ID4+ID4gKyAgICAgIG9mIHRoZSBVLUJvb3QgSW1h
Z2UgVHJlZSBTb3VyY2UgKElUUykuIFNldHMgdGhlIGZpcm13YXJlDQo+ID4+ID4gKyBwcm9wZXJ0
eSB0bw0KPiA+PiBzZWxlY3QNCj4gPj4gPiArICAgICAgdGhlIGltYWdlIHRvIGJvb3QgZmlyc3Qu
IElmIG5vdCBzZXQsIHRoZSBmaXJzdCBlbnRyeSBpbg0KPiA+PiA+ICsgImxvYWRhYmxlcyIgaXMN
Cj4gPj4gdXNlZA0KPiA+PiA+ICsgICAgICBpbnN0ZWFkLjo6DQo+ID4+DQo+ID4+IEV4dHJhICIu
IiBoZXJlLg0KPiA+Pg0KPiA+DQo+ID4gV2lsbCBmaXgNCj4gPg0KPiA+PiBXaGVuIHlvdSB3cml0
ZToNCj4gPj4NCj4gPj4gIiIiDQo+ID4+IFRoZSBmaXJzdCBlbnRyeSBpbiAibG9hZGFibGVzIiBp
cyB1c2VkIGluc3RlYWQgIiIiDQo+ID4+DQo+ID4+IEl0J3Mgbm90IHJlYWxseSBjbGVhciB0byBt
ZSB3aGF0IGl0IGlzIHVzZWQgZm9yLg0KPiA+PiBVc2VkIHRvIGJvb3Q/DQo+ID4+DQo+ID4NCj4g
PiBFeGFtcGxlOjENCj4gPg0KPiA+IGNvbmZpZ3VyYXRpb25zIHsNCj4gPiAgICAgICAgIGRlZmF1
bHQgPSAiY29uZiI7DQo+ID4gICAgICAgICBjb25mIHsNCj4gPiAgICAgICAgICAgICBmaXJtd2Fy
ZSA9ICJmd0EiOw0KPiA+ICAgICAgICAgICAgIGxvYWRhYmxlcyA9ICJmd0IiLCAiZndDIiwgImZ3
RCI7DQo+ID4gICAgICAgICB9Ow0KPiA+IH07DQo+ID4NCj4gPiBCb290IGZ3QQ0KPiA+DQo+ID4g
RXhhbXBsZToyDQo+ID4NCj4gPiBjb25maWd1cmF0aW9ucyB7DQo+ID4gICAgICAgICBkZWZhdWx0
ID0gImNvbmYiOw0KPiA+ICAgICAgICAgY29uZiB7DQo+ID4gICAgICAgICAgICAgbG9hZGFibGVz
ID0gImZ3QiIsICJmd0MiLCAiZndEIjsNCj4gPiAgICAgICAgIH07DQo+ID4gfTsNCj4gPg0KPiA+
IEJvb3QgZndCDQo+ID4NCj4gPiBFeGFtcGxlOjMNCj4gPg0KPiA+IGNvbmZpZ3VyYXRpb25zIHsN
Cj4gPiAgICAgICAgIGRlZmF1bHQgPSAiY29uZiI7DQo+ID4gICAgICAgICBjb25mIHsNCj4gPiAg
ICAgICAgICAgICBsb2FkYWJsZXMgPSAiZndBIiAiZndCIiwgImZ3QyIsICJmd0QiOw0KPiA+ICAg
ICAgICAgfTsNCj4gPiB9Ow0KPiA+DQo+ID4gQm9vdCBmd0ENCj4gDQo+IFRoYW5rcyB0aGF0IGNs
ZWFycyB0aGluZ3MgdXAhIENhbiB5b3UgbW9kaWZ5IHRoZSBsYXN0IHNlbnRlbmNlIGZyb206DQo+
IA0KPiAiIiINCj4gSWYgbm90IHNldCwgdGhlIGZpcnN0IGVudHJ5IGluICJsb2FkYWJsZXMiIGlz
IHVzZWQgaW5zdGVhZCAiIiINCj4gDQo+IHRvDQo+IA0KPiAiIiINCj4gSWYgbm90IHNldCwgdGhl
IGZpcnN0IGVudHJ5IGluICJsb2FkYWJsZXMiIGlzIHVzZWQgdG8gYm9vdCBpbnN0ZWFkICIiIg0K
PiANClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQgc3VnZ2VzdGlvbi4NCkkgcmVzZW5kIHYyIGhl
cmUsIGh0dHBzOi8vcGF0Y2h3b3JrLnlvY3RvcHJvamVjdC5vcmcvcHJvamVjdC9kb2NzL3BhdGNo
LzIwMjUwNTIzMDg0MzE0Ljc3NTQ5Ny0xLWphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbS8gDQoNClRo
YW5rcy1KYW1pbg0KPiBUaGFua3MsDQo+IEFudG9uaW4NCj4gDQo+IC0tDQo+IEFudG9uaW4gR29k
YXJkLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4g
aHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

