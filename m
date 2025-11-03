Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E0FCCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 10:33:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17769.1762166036365694046
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 02:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=npgIG3jK;
 spf=pass (domain: ericsson.com, ip: 52.101.83.61, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpLrV7OyvDQVjbwTN2I4FBaUrcKh7cXwZD2osrcaR9PDR9hua+BMQTzhSnDrHp37BM6dIZ7eX7u/d/FO0tsp9pPx9SPReLa65RZTv22NuIrLvq1tP0DONehXFTg6rnCU7D2dvtcetXZG5NblXwICW8xAKxlVC9ar36h1LnA3WqOkWN9iK2I8KeDf+16nbPrk2Uab1HVmSUSUt5z2XffsjVgGUHeQzLJwXHL2rBTt4qMYG6YRR1jtl236UVmoqa3NKWqTtH6tiZLflhoGm0MfOLt3CWThbNZZExY42A7hGIpJe6VpiXqpeXPdqR5cfq4xI3kEazAN0ZF07Q808nPtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEMUIWDkis9i8RWuAXZ1weKV1BipDVwB40iIL3TwVdw=;
 b=zHA7w9HFOlPCSSo9CSN8+rnTehSGueUgifiXllGsL1BOhYXZ+u7CCAy2ercLN2a2TuB3AeBZsu5/jgzfbPWTJpvTSe6BI4MfPHGSQGHq+shjiBWtXDo8RCEH8BvEqn74SumjHL3IjJRSTMp+exxEnxKMKJdeQH4M01DgKEOdAGQtjAprZQNk185Ba0fclUcEUlBvY6BZTQToMv8reLA+AYhXH7wxMlrwYBLQfGhKMXsZAr3QD7GyjVUxfXH4FtQZGicRs4GtTFzRAdCMkbtCKBbsIeohy1HdoO/JDrZw2q2K0FWFJTOtkPHwXLlSj/wfX2alGTgyPgbS895I6fBUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEMUIWDkis9i8RWuAXZ1weKV1BipDVwB40iIL3TwVdw=;
 b=npgIG3jK+q20Ji0Sxc3xfc3zT1Dt7q6e9j2Lb1BYopWTnI9J0B6SjpkVA514k67P7r2bS1Bv1ADrjDHIBZG22JShVX5s1Hb3bko/4PFNUQY0026IBNMAbObxcygnOWfQjPQnIJnmHC3DdaXc2Zrq4EruiK7aCORAYBG4nr/l0q/FkeE9z28pBz7vq45m2wxrjD14Zt12i6YcyM1PrW02158URZ0wrHUYjXT1H4qnXt4eq4nZGSwzEahqCWSYR7/7DwsZpHqPwhOcJgQW5+fFNaAHpCrlGPgRTqR2vh7u0TcV3tMQ6GJIfkqJdAwLWr8PH19VEIJPOe+E9mm97Qe6oQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GVXPR07MB11127.eurprd07.prod.outlook.com (2603:10a6:150:2c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:33:52 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%5]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 10:33:52 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, YP docs mailing list
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] tweaking the cve-check documentation
Thread-Topic: [docs] tweaking the cve-check documentation
Thread-Index: AQHcTJu7hyD+aURduk6singTBa6kibTgwQHg
Date: Mon, 3 Nov 2025 10:33:52 +0000
Message-ID: 
 <PA3PR07MB107215CBED1BB908E2AB76DE08AC7A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <2440e0a7-9f89-5fcf-f8e9-78b8c09bf7e1@crashcourse.ca>
In-Reply-To: <2440e0a7-9f89-5fcf-f8e9-78b8c09bf7e1@crashcourse.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GVXPR07MB11127:EE_
x-ms-office365-filtering-correlation-id: 08c5a01e-b094-4634-1425-08de1ac47bb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NzlJYkE5Y2Q3cWs5bGNCOXZCL0gxNVEyb09wNm1wR0dqVFY2S012N0czNkh0?=
 =?utf-8?B?bVExd053NjlxY25OTmJ6UktaQzlxUkF2VG81TjZUczVNQTRCSm1Mb0dab0lG?=
 =?utf-8?B?L1BSVTI4THJuUUNCM3o3eENtMWJxRERIdTBPNERVYTRJNU9YS1dGLzF2aXJI?=
 =?utf-8?B?RFhpMlRWWHlXaGNmTDN3a0dxaVBUN0l2UUxkMVVlRCtCT2k1Si9yQ3RBTStX?=
 =?utf-8?B?b1RJOTk5cVc2REdWdGhGSU1ick8rdWNMUEpIazcxTmM1dEdtZVBUUlZrZjg2?=
 =?utf-8?B?V3Nwck1hbTk4WnBVL1M1c2kxaDE0K3RoaXBMeUkxUFJ6cHJJVFBLYTBqU0dL?=
 =?utf-8?B?YmF5Y25tVWtQYjdEZ3VLUGUxZk01SjVmYUZPaHM5VkpUWnBPanBKVmpMOU1N?=
 =?utf-8?B?eTBIam1yOGhjN2d5MGNpQVY1ak9qT3FTZ2l0T1laOHdsVmNRaHk3VWNhaHQx?=
 =?utf-8?B?R2g0dzJnOVE3VU13M0ZxMWJ3N3Y3UDhTL0EveGNXU2MrcUkrcGtLaFVTYkdX?=
 =?utf-8?B?eVNBZUY2ZjFYN0JQZThWLzhOcm5nWjYvVkhILzZPSWdJaEE2RzRWaWJtR0x0?=
 =?utf-8?B?MUJxdnhXWGMxRU9sdmY4TUNOc0R4RFA1THdINlR6VTlnQnRDRXpRcTFMRzR3?=
 =?utf-8?B?VkdRUXoyTERNNHpvb2EvcEhsRFAyd29VNWVqemNNNjNQTmhQcndjY00wZFB5?=
 =?utf-8?B?c3ZYMW04MGFQc2N3ekllbElSME5ZRm96RmNNR2J2RUtIdHE2Qk91Qm93K1hG?=
 =?utf-8?B?dWkxdkxwVGMvazlNZEZQWmxBQjl5NDNQREoyT2FEMlJ0b3Q3aHhneHZGQ1ps?=
 =?utf-8?B?bDI5UWVjakVwWHBjbVMzSHFYR0VhVjBxMnB3cmlLYmhYbWJSVkJqUlM3dEJs?=
 =?utf-8?B?d2RDMXBxTE1ETnR1RVdpQVZlZmxPRVR2WWcrRU8wdk5WZWhpM0pYWUE4VjRl?=
 =?utf-8?B?dFdONUVBMjgrMnpkaXBQOTN5anQ4dElpakZJTDRTamVWbUxKdmRNU3g0ZThE?=
 =?utf-8?B?MDJSQjNtdjVtS1F0dDQ0RVgvdjJTbm5OWnRBWnQ5clZYMUJvMndTY1RhM2c3?=
 =?utf-8?B?L2RoRG1nL2U3MDQ5TXd5SFhWZjVtNmpKYWxxaUhxQWhNN0kyeEc0NWd3QW5u?=
 =?utf-8?B?OE5ySXhvV20xMXZGMTVrdFdFTGpaM2FOei9Pemc3a3NXVThic1NqQ0tENzFz?=
 =?utf-8?B?L0padVJZV2wvK3kvSGxQTjVnMVJIUFpzQllqRkJTSFM5bitwb3VDS24zaEZy?=
 =?utf-8?B?clBtWThKTm9KN0pQUXdLQ0d2MTFuM2pGcXdoNmx0UHcrZzdTaWdZRUJWVnNW?=
 =?utf-8?B?QVEvNkZyd2ZBZVdYRGQ2MzFDWE9uY3JaNnpRbC90R283bUd0R2pXTSt1OUNU?=
 =?utf-8?B?SU9FanhJWWFsSStzNWFzUlpPRTVwWmZwanVPOE5RN0tkM3pWYWZCdHVITGlL?=
 =?utf-8?B?cm93UTQyeXdLR1pGa2NhZGtKakV6d3E4VUtoV3MyeUR2bURtZmNnei9GUGhi?=
 =?utf-8?B?N29RUjVMQkdpQzUrNFZ6b2RJQmo1K3hjQVFtUkpFOXlIR2lLWjFlekRuZWFp?=
 =?utf-8?B?eE9Bd0ROTnRCSHV6RzdtMjNnNTZVMzZMKzNtRFduczdvWE8rc2dVc1ZhOHB3?=
 =?utf-8?B?MzJHb3creE9nTUFFTUJlblU0anl2ZmlLWm1jYmFaMlJ6RlkwMXVMQU9JLzhR?=
 =?utf-8?B?anZtcTAydE5lc0xscXd4cHFHMW90dFZIS1pYK01zRFQrQUhyYmNxSnR1MmVV?=
 =?utf-8?B?RTRsS25VVkEzblQ4S3BxaFBXOWJtU01LYWZMZXR1a0xWWlk2dUJ1K0xPbWE4?=
 =?utf-8?B?K2xvVWhaQVVKY3hTR3FBSnhLamxCZ2hTOXRLWWtlbXdVMnRVYStQUE4zYWpw?=
 =?utf-8?B?and3ek5SR3FjWnI1S2VGampBVlVkY2hrWlZMemozcGIyVlBiWkkrY0xwQXVJ?=
 =?utf-8?Q?VPvGdfgkpeQGMZQecNRcg/MvYIxjMrwF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d3g5SGVyd21IcVZmTG1aY3o1Q2o1alNwb3NWY295YTZCWWRtaGd5VzdNOWts?=
 =?utf-8?B?MmUxa1RZNjBPTjczL3A0UndaT25yOFhORzRJRnlwOUZQc201Zm9NOXV2dGo5?=
 =?utf-8?B?SXlwaUVWSktlQ0JVcUpUNC9XYklON3FVanBYY3RFdDByZDZTc21hdndwSjJo?=
 =?utf-8?B?SkN3dFhkYlFJd0hydGN6bmlya1ZLRlY5UlFDTDFLbmJlaHlSWktLTDF5UnRO?=
 =?utf-8?B?ZTd5SHhseC9IVTI3dVBIV2I2ZjV3UVp5b1B1a1N4NmxteTdUaWQyb082NG5r?=
 =?utf-8?B?K2dFcFRGWWtkaWQ4Q3ZIWmlMTXBUbGRyeVVRbHdmWHJUWktTZDJBR1ZkNnFV?=
 =?utf-8?B?b1BFOFBXSG9QUDFaMlpTWTBWaGtJVTlHdnhPekYvR3haTU9laXY0THk2dWdw?=
 =?utf-8?B?c1NUSFBFOHVUS0NUaC96TUdQbXFmb2lUZnpJQUJWdjNTbG1PYlZNTHh4ZlU3?=
 =?utf-8?B?OGdLYnQwRGFpQlJxTjJoSC9oeGFlU0g4d3ovNXNONnpqbXo2L1IxUnBqTlBP?=
 =?utf-8?B?VW4zRzk1K3pYMlkvQ2pONXc2TVNHbU9KaUs3VW5wSzZzOWl3TzM3bVhDK2sz?=
 =?utf-8?B?RTlMUlFVZEhKeFBTRDRhWmxaRlU3aWpmZXd1dys3Z1BOQ2dUMng0YitSNFVk?=
 =?utf-8?B?TTJoUFhQdkVJMjhsM0d0TWF4YnpiNVdtNENGK3dPT0tKTXA1UDYxQk5KOEN0?=
 =?utf-8?B?WERLVlE4MTdQakN2dGxGdW9yVUVNSUdNaWRtZklETnJrRWhGMEZEVnNwbGVY?=
 =?utf-8?B?VlFCbGtpcFNqaUdFVE9DWFNDL3EvY1l2UWFTb3YwK2ZmeHF1OHBEQzRLTmdl?=
 =?utf-8?B?V2lyaG1HRHNxaE9JZUN4SDZhWnU1ZXRKOUc2cHFrT1FIemZoMWRDRVBUd0Iz?=
 =?utf-8?B?U1dQWXByaUpGMWlZWjdoTUFVKzVRbzM1Y3FIUzk0eTZIVXA5ai9ORStiVmVD?=
 =?utf-8?B?aGlQTGhmdmZsNUVDcXE4d2tzdzhpWEhmNVM1V3pnQnpaZ3hUVHpBSkZXVkVX?=
 =?utf-8?B?T2xpQXArY0JLdlNublJraU9LUW12WGhPMTdWeEZOYjBhTUVvR09IVGVtTjVC?=
 =?utf-8?B?QXhWWSsvQzBtcDlITElTcjc1Y1RXVjBGSGtYM3pTTzAxak9jWXc3WEFIMlpy?=
 =?utf-8?B?QTlxWGRvK3lXc21aNXFYbWFrcTlIUU5KeUxOb3VCWUFyWW44NVI3UndCa3Np?=
 =?utf-8?B?ZXlsME11M0ZWRHpWUTJUSWdqVWx5STFIRVd5cHo2dGtXc2twWHpFRFdXREFl?=
 =?utf-8?B?NDJDV0xSeUdYM0d5TU1NcXdiVnVVWG9BaVRrWkFBbTVMaHNBODFxNlNWM1FO?=
 =?utf-8?B?V3R4UmpscEdadDl2c1JER2FQTS84NytER1JabXU0STlxKzFtWkNXbnJGc0Nj?=
 =?utf-8?B?cDN1ZVpLM083UWRYcXVSUng2a2F1MlFvZG5BbktHMHNucUYwNTA2eTZGOVZ6?=
 =?utf-8?B?ZWpiWWdWZTZCM2pIS3RXOWVXZU0wRi9DS24zeXZlOEpOQTVXVmhiTCtkdEN2?=
 =?utf-8?B?b1l3M2hzRzRiVWc0cVpRZ25mN3Y5alBUSkRpNEFOWmlkZHFNTHdxQXFtVzhQ?=
 =?utf-8?B?QlF1WklvVFRId0RHYWUxTE9HRWpKVWYzcDQ0czUzY1FtNDB4ckpRRUl5Wk5z?=
 =?utf-8?B?L0twWVlOL04zUkFiS0pxN0NUTFgyRUUvUkszNE1FTjIyTHM0YS8rQzJyejVX?=
 =?utf-8?B?YVdxRnlkc0VVTWxxczg0dzBZYkkydE5ENDhqaW1RZVRXTWQ1SE9xMWFMYlVq?=
 =?utf-8?B?aXhHQ0lNOUIyVFQ5Rkczd3RLN2cvKzNvYXE3OW5WZFM1WmVtZ2V4V2ppcTJP?=
 =?utf-8?B?UkNsR0ZlT0N1SW9PY1hhOVpHKzlscllyS0dDTnVxT25uTzRYbmxabHlFdkwv?=
 =?utf-8?B?Q3oxU3pXUUY4OHgwczVxZnY3UitWQjN3b0FLWVR6UHBBU3R2VFRiY01BS3Yx?=
 =?utf-8?B?eUEzelFJZitvdUVYNVhvdEFnclNBZW9sR3VBNysyWnBBN0Zubkt3S2xpeU5Z?=
 =?utf-8?B?U3Roc3RwZitNT01rdlArWlhEMXByU2pyTDBTTzh1d1BVMU1PelJLWXFEeFFU?=
 =?utf-8?B?VXZUclM2ZDNzVnp5UTBxQnFSSVRnUlNWWjJKMFJmM3ZPVndrVTRZZXVuWVND?=
 =?utf-8?Q?yXyJWVAkwlFhaVGPbz96EjsxR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c5a01e-b094-4634-1425-08de1ac47bb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:33:52.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kEiD+gKu6wGBhP9UvLPzu2mjAJxZKwoP0Ol9Zex3hLGZ9pU0fq/yJYOJfnR/9ZW/BdTpLBSGVzI5D6VsaS4w+1gTZLohBSX3CBvgNu7OZbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR07MB11127
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 10:33:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7966

SGksDQoNCkluIG15IG9waW5pb24sIHdlIGNvdWxkIGhhdmUgYWxsIHZ1bG5lcmFiaWxpdHkgcmVs
YXRlZCB0aGluZ3MgYW5kIHNjcmlwdHMgaW4gaHR0cHM6Ly9kb2NzLnlvY3RvcHJvamVjdC5vcmcv
ZGV2LW1hbnVhbC92dWxuZXJhYmlsaXRpZXMuaHRtbCNjaGVja2luZy1mb3ItdnVsbmVyYWJpbGl0
aWVzDQoNCkF0IGxlYXN0IGlzIHdoZXJlIEkgc3VibWl0dGVkIG15IHBhdGNoIGZvciB0aGUga2Vy
bmVsIHZ1bG5lcmFiaWxpdGllcy4NCg0KQmVzdCByZWdhcmRzLA0KRGFuaWVsDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3Jn
IDxkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBSb2JlcnQgUC4g
Si4gRGF5IHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFNlbnQ6IE1vbmRheSwgMyBOb3Zl
bWJlciAyMDI1IDA5OjI3DQo+IFRvOiBZUCBkb2NzIG1haWxpbmcgbGlzdCA8ZG9jc0BsaXN0cy55
b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBbZG9jc10gdHdlYWtpbmcgdGhlIGN2ZS1jaGVj
ayBkb2N1bWVudGF0aW9uDQo+DQo+DQo+ICAgb25lIG1pbm9yIG5pdCwgYW5kIG9uZSBsYXJnZXIg
b25lLg0KPg0KPiB3YXMgZ29pbmcgb3ZlciBDVkUgY2hlY2sgc3R1ZmYgYW5kIG5vdGljZWQgdGhl
cmUgaXMgbm8gbWVudGlvbiBvZiB0aGUgaGFuZHktDQo+IGRhbmR5IHNjcmlwdHMvY3ZlLWpzb24t
dG8tdGV4dC5weSBzY3JpcHQsIHNvIG9idmlvdXNseSB0aGF0IGNhbiBiZSBhZGRlZC4NCj4NCj4g
ICB0aGUgYmlnZ2VyIGlzc3VlIGlzICp3aGVyZSogc2luY2UsIGFzIGkgaGF2ZSB3aGluZWQgYWJv
dXQgYmVmb3JlLCBpIHRoaW5rIHRvbw0KPiBtdWNoIGNvbnRlbnQgaXMgZ29pbmcgaW50byB0aGUg
cmVmZXJlbmNlIG1hbnVhbCB0aGF0IHByb3Blcmx5IHNob3VsZCBiZSBpbg0KPiB0aGUgZG9jcyBw
cm9wZXIuICBmb3IgY3ZlIGNoZWNrLCB0aGVyZSBhcmUgdHdvIHNvdXJjZXMgb2YgZXhwbGFuYXRp
b246DQo+DQo+IGh0dHBzOi8vZG9jcy55Lw0KPiBvY3RvcHJvamVjdC5vcmclMkZkZXYtDQo+IG1h
bnVhbCUyRnZ1bG5lcmFiaWxpdGllcy5odG1sJTIzJmRhdGE9MDUlN0MwMiU3Q2RhbmllbC50dXJ1
bGwlNDBlcmljc3MNCj4gb24uY29tJTdDZDIyOGY1MTZmNzk2NGU3M2E3ZWMwOGRlMWFiMmRjYjYl
N0M5MmU4NGNlYmZiZmQ0N2FiYmU1Mg0KPiAwODBjNmI4Nzk1M2YlN0MwJTdDMCU3QzYzODk3NzU1
MjY3MTUzMjk4OSU3Q1Vua25vd24lN0NUV0ZwYg0KPiBHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9u
UnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNDQo+IGlJc0lrRk9Jam9pVFdG
cGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT0zZ1hPYWx2aXdlDQo+IFZQ
NlZ6OE1iV3o5aFplWHdjJTJGV3ZJdWhMcSUyRkclMkZlTDh1TSUzRCZyZXNlcnZlZD0wDQo+IGh0
dHBzOi8vZG9jcy55Lw0KPiBvY3RvcHJvamVjdC5vcmclMkZyZWYtbWFudWFsJTJGY2xhc3Nlcy5o
dG1sJTIzY3ZlLQ0KPiBjaGVjayZkYXRhPTA1JTdDMDIlN0NkYW5pZWwudHVydWxsJTQwZXJpY3Nz
b24uY29tJTdDZDIyOGY1MTZmNzk2NGU3DQo+IDNhN2VjMDhkZTFhYjJkY2I2JTdDOTJlODRjZWJm
YmZkNDdhYmJlNTIwODBjNmI4Nzk1M2YlN0MwJTdDMCU3Qw0KPiA2Mzg5Nzc1NTI2NzE1NjUyNTkl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uDQo+IFJ5ZFdVc0lsWWlP
aUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZR
DQo+ICUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9ejJiZ004RGhBV1BKbm9KaWp3MlpoeXFXOW1C
b0k0UEVpDQo+IFNaUEFTZmNoZm8lM0QmcmVzZXJ2ZWQ9MA0KPg0KPiAgIGkgdGhpbmsgdGhlIGNs
YXNzIHJlZmVyZW5jZSBlbnRyeSB0cmllcyB0byBkbyB0b28gbXVjaCAtLSByZWZlcmVuY2UgZW50
cmllcyBvZg0KPiBhbnkga2luZCBzaG91bGQgYmUgdHdvLCBtYXliZSB0aHJlZSwgcGFyYWdyYXBo
cywgdGhlbiBhIGxpbmsgdG8gdGhlIGZ1bGwgYW5kDQo+IGNvbXByZWhlbnNpdmUgZG9jdW1lbnRh
dGlvbi4gc28gaSdtIG5vdCBldmVuIHN1cmUgd2hlcmUgaSB3b3VsZCBhZGQgdGhlDQo+IG1lbnRp
b24gb2YgY3ZlLWpzb24tdG8tdGV4dC5weS4NCj4NCj4gICB0aG91Z2h0cz8NCj4NCj4gcmRheQ0K

