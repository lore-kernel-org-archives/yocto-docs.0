Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3385C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 01:40:35 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.138])
 by mx.groups.io with SMTP id smtpd.web11.39336.1747964432484146116
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 18:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=h70vFomh;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.138, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GN00mzfHfOP5HvARhqogRaxr53niQmXqdI1FfB2JHZNelO/f3+GYIZmr1jOCrqQmVMZGBQTQ8B39+N56126CxQpBNok6jkHoYkpX7OIKp3i4Tvq9J86RPml1TP0lqdE5msKTUkJzkzwBJGf1xokDQkzvjQHTofo4dX6RIomCUM/cnB5EwEyFAXoLjRiZUNl48VG+20idhQu/073EwkedmJHnabTgoT6aCRjMb2SWeYErq2ghdLn/An/TdcQDwZC00Zkjjswq2guIxsX4MOF5crrgrmp5tkkoCTyWGlmPRTVcdwHdgKc9zUNfRKkYFYc2DGLwOkw3rW1n/ojU2Sv0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeptiks5ocL0jSvlQvOZm4FBTYio9sqxxKGHNEzbO/A=;
 b=Eyl8gwigMdX1x7VvSW85zYUD4os+XLqzP222jEMY2AXOUhrYqJR6JBhni5i+JckMcAQC5kTBcC5fghX8fXxY1vgMdSHYvGLbUTSddZ74jjlxghE4Q5czt2CHRHNZFlhH6SsEjrpSPK2DOxtjxua1Q29fKwl6CG/yhHDavxur0lR7kzkNgcwrK97jtSBR2Rbr1CYwg+cytdVtD9JGNKbyH/pcGgAu2wWXPkUE4AKRSmgEpjkdS8+j/uaDvO5cwHZVWMSOj3GqMFUE3ytf+Zv2U0sLllfgv7O7XE6urSH7LXk2DM4gP6CURTilkSAFA9s8vgQR59/v8LUFVF34Yafe3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeptiks5ocL0jSvlQvOZm4FBTYio9sqxxKGHNEzbO/A=;
 b=h70vFomhFGp47/pSFIggJZGgUdrMGftguIF/YAgV3FWj8DP3VTHltdGrksNKeh6jlr2Jfu0jagxsvbHM/6WdHn4D99DWe5RDZJ5mJ7Fci8aQzzeTCeDFULig6WgA8MbmjCMj7o6QFgxh7s/knzg1cwhnQGCMctKbkwoBFmvMr+A1CtcdcmiBFsyTO9aq+TaMpqd8rUpLagIq/m9rAuf1lJJy4ODoNei07nnQAG5kRpFkBFuzZYaxchUg3GJcVRNAELr3j7Wlv4b7jn8ROAgSHAFVDlRTs2LVAPFknWQxxuPsu5VnzQtkIefIqtS8Zs0Wu6DXU+sxsk/qn1D6pThoAg==
Received: from SEYPR06MB5037.apcprd06.prod.outlook.com (2603:1096:101:51::5)
 by SE1PPFF9F12DF7E.apcprd06.prod.outlook.com (2603:1096:108:1::432) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Fri, 23 May
 2025 01:40:25 +0000
Received: from SEYPR06MB5037.apcprd06.prod.outlook.com
 ([fe80::7c38:ebde:a05c:8196]) by SEYPR06MB5037.apcprd06.prod.outlook.com
 ([fe80::7c38:ebde:a05c:8196%7]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 01:40:25 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [docs] [PATCH v1] ref-manual: uboot-sign: Support firmware
 property in FIT config
Thread-Topic: [docs] [PATCH v1] ref-manual: uboot-sign: Support firmware
 property in FIT config
Thread-Index: AQHbyW1EAaXEM/UtCECPmisvEGvnU7PeZq8AgAEG5gA=
Date: Fri, 23 May 2025 01:40:25 +0000
Message-ID: 
 <SEYPR06MB5037376466D185F30EEBA725FC98A@SEYPR06MB5037.apcprd06.prod.outlook.com>
References: <20250520095457.3642012-1-jamin_lin@aspeedtech.com>
 <DA2L51D2Z4RJ.2MJEUG0QTSSXN@bootlin.com>
In-Reply-To: <DA2L51D2Z4RJ.2MJEUG0QTSSXN@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5037:EE_|SE1PPFF9F12DF7E:EE_
x-ms-office365-filtering-correlation-id: 7183c6c2-02a1-493e-4b49-08dd999aca55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ejRyVTJFaXJib2tNcC8yUU1LbjRpcnNhaS9NTGI3QjF5QmFlZkhVc251Nkkw?=
 =?utf-8?B?L2FMcEEyYk5zS3o1UW1ERVdxdDEzSkcrMGhWdHRITHI4WjdNSE5DbHcyMW1E?=
 =?utf-8?B?V1ZnNVlYK25nZTFGK0pzZnhWV1loZDZPbnZ4TEpzRUV2RFJLbjZkbXdjVkJF?=
 =?utf-8?B?YWk1N0ZicWkxdkw1SmZCQUlPbXIrNC93VFZTTDdNTE95Tks4bkgwTTRhZDNn?=
 =?utf-8?B?WHU3N1J1eGUydzdBMTlIS255QmVXeGpuWFZxMFF0aVZQRU11d3pmR0laSmV5?=
 =?utf-8?B?YkllVG5NMkdGNTMyakJTSHhDM0lOWElvQmVjbjROWnhVbDY1SEU4SisrQ1Z1?=
 =?utf-8?B?WFlVMEYwOWxCbmNTZkZKeXFDMSs4UlFUN25WZEJOZUFjM0IzdUhHOXJOT3NG?=
 =?utf-8?B?MGVYb2xySFluQ2M3TWo4MStDY1B3TFdYMk5FSDhZeGhQWFI2TjM1YjhFZFZh?=
 =?utf-8?B?VmRHV1dseThCUXkwQytncThyK29ja1kwSTF0UFZnRFJFQTRQVzMvTm5IZDF0?=
 =?utf-8?B?U0VGbzNwOXkxZTRraFdKY0ZGblY2VENQMjBKakxvWHBMenhTZmE5bmRTYXc0?=
 =?utf-8?B?ejBLWVB5aG5Ga1lCalJORmkybDNndy9VT0lUNDRuSTNKSHlyWGRMbkdQZEJJ?=
 =?utf-8?B?SklGTHNIL1ZuU0xYdm9pa3lORmd5VWVuU0FuNHBHOE5ZSFNuSDBrS3Ztcm52?=
 =?utf-8?B?KzNENDZxMHBIeUZEcHB5aHFLdzRiRldEelIzdGFYYWVYS3k5TkdhTkpsbmlV?=
 =?utf-8?B?Z3l1dnZUVVZXbm5oRVBNQWtTdkdNaU1pcGFKbHlhV0lqemVXK1R0a1RVM0hG?=
 =?utf-8?B?SW9FTTZsWDh1aEVpV2VFa2FQMm8xclAwYkZwMzM2bVVDL3ZIKzlkV1FNUWU1?=
 =?utf-8?B?SkF0alB4azQ5MThEVFE3RXpqdFNoQlRNRVlLVlYrSTRoQ05NZ2NwclFjN3ZL?=
 =?utf-8?B?VEVtWmlxczQwRWEwc3NmYkdjTmtHc2Y3RldXYVprNUN1RUovT29qNzJVS1Y1?=
 =?utf-8?B?ZEhMTmkwS0NIRFo5NmhIc1ptV25zZWVlL0Y5cWRPU2pISHE0MEc5NEd4Vk5E?=
 =?utf-8?B?d1dCYWxtbkNXY1dsWDFYSmI1ai9IVlpwTWkvM0NNaGEwa05QTmRUQU1ZbjFa?=
 =?utf-8?B?WEdWcVhQa2REc3VrR05ndWRrbEcxVlZ3ME1YNitia21IRWp0S0NJS2o4ZEtF?=
 =?utf-8?B?R2lGSnRaZDMwUFg4eHpkOGdsUW9QdERaanhyalFJS2tCTCs0YUVqRkNlM2Y2?=
 =?utf-8?B?UC9WSUF1STl1WXVWa3NNUnlXeXZBZ1p5aFZoUXJXUlhoV3FOOE5pWkNkRzht?=
 =?utf-8?B?NmFOQitkaFpCaTNSRmQ3SmdTOU1ZK3FHWWV3VTFYYisrRzFyK3UrYUovYldj?=
 =?utf-8?B?RElQT3QxVXAwRndEWlhITUdJK25wTjVZaUx4TWgvMEJPdUlwdVBHUVVMbkg0?=
 =?utf-8?B?b0JERitUblJHejZkRnlMTkNienZVYzZrblh1bCtPeWJMMDNLRlcrV1NBbXpk?=
 =?utf-8?B?Nk9hMm1mSW9zRUhnN3VOSDhnaFU1S05FNlFPeCtEdXlpVnA4RjFRc2ZFbnRR?=
 =?utf-8?B?a213RVdRV1NUekFYbzF3OWYxakZ4eEQ0MHNJUFI3Y01reFVXb2dnWVlXa21Z?=
 =?utf-8?B?UXZsMS9iYytyU1ZpNGEzNkF3aFBTOXdyTVJXV2RQQ2RsMzVPS3g1U29FNU1q?=
 =?utf-8?B?Q1c5KytNL250TEtwaXBVc1g2K3N2M040NElTOG80MEhPb0VVMVc2TXVZV092?=
 =?utf-8?B?VGZxcm5jQTVBTG1EaTFvTVhWYUtPeUhteG01UUdadGJqOVhnOTVTNFJSdFZO?=
 =?utf-8?B?WmJDdUVYaXE0bHZUazZZcDRER3d6U0orYXZMYllHRUFpclU2NTVROGNPUUg0?=
 =?utf-8?B?dmUwM0NjeFNPWTZOZUJPQzk0NFU2Y0JwVTN3LzZhVzRKYnphOFZoNVZFRnoz?=
 =?utf-8?Q?bW9Jb0R8NHI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5037.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emMvTU1scy9EaGxBTTU5RXVPL05MeUdKazRNL0lvT1o2cFZFSDJSMEMvL04v?=
 =?utf-8?B?YUZXUWl4TEJuNjlUbFdlMzJ6a3lSY1FodTlwT01Tbk9zaHo3ZGNZOERJY294?=
 =?utf-8?B?dUphc0xBTmRKazRtbm96RzdmRDlVb21mM2xlTVFOR24vZ0ZsUzZTcmRzeTRZ?=
 =?utf-8?B?S3JKTjVlSDYyUG5vQzhlRVhBRjRpZFNJbDJTL0lEWE95b3IxYlNJcDJLd3hz?=
 =?utf-8?B?a3c2bkZKQzJrQ3JlNjBxLzNEMzJtSlQ4VnVjYWFncXA2RVFXTWFwK2N3RDQ5?=
 =?utf-8?B?Q0thY3VpUkpBdlVnWTJnUzB2aVJiREo0N28zTW9ZSmEzYXk1UUgxZ3laWk1E?=
 =?utf-8?B?TEpGbnJRRUZxOVMzVmdtaUNBSUE4bTloTGxoN2V1NjRTcWE2TzNFVmdGU091?=
 =?utf-8?B?Wjd2ZldXZGRxSkNhKzZLMTdHZUVsN2VERVhkNnVmUTYzMTVrYmlpWjVrWVlL?=
 =?utf-8?B?ak9sL3Byck55TGU3WGFpK3dXcjNVMDcvcUUyQmEzTWd1RFl0blIzWmpWdmQ4?=
 =?utf-8?B?bDllRWEydDhoNzVncTVHVUplN3hIcG9qcWJVUlh6ZEdNd1hKemExQU9sb2o0?=
 =?utf-8?B?L0ZKVk1vWEhUbjFoYlM3bUszcEVEMmZmYWRSQmkyUENzNXlzUExkaXhUdEE0?=
 =?utf-8?B?QjI0bi9yZXNTc2kwb0FKTW5weHR2dFlkZU1jN1I3U2hpK0tFVm9oM2txSHls?=
 =?utf-8?B?K3czcXJEdFFZeTh5RURaZ2czUHp2RGFQdGR1cnZ0NHRoVXBVbzlSbmhBWnJ0?=
 =?utf-8?B?VC9uQ0g2WGZVWjhSbFJFQ1lOYmlFZGowVWcxeGt5REViS2QwRVF3NHo5U2x0?=
 =?utf-8?B?K3R2c0piVFFaOEplSHVOazNsOVdDbTNuODAwc0YrWlljbW4wejZLbS85b2Jn?=
 =?utf-8?B?NlhmMVJSYk9QcUJubFo5MmNUdXZCeVkweXM4ZGE1SVlySU9oM24xSHMwOVNR?=
 =?utf-8?B?K2N3blhUdlpwTGkzRGVjcExtR21oaDd4NCs4VU1RSUhYOTdKd2hHZWhJNkZ1?=
 =?utf-8?B?M0ZZMjRRUnlVNnY2RnpUM2ZtUm03ZDlGdGxnSm5ZdFI0VWJCcVV1UWJYVWY2?=
 =?utf-8?B?K0xxWTd5OVJSMU9vY2xhRXBnSmdHTjNIeDlaRlM1N0U2YjBLTzd5dGkwRlZv?=
 =?utf-8?B?dCsvNm5pa0swYXFibGRmbk9hN2hyUFQybkxpOGp3L3cxMDg5UmNkcEMvV2R2?=
 =?utf-8?B?dnorbGhVbVdJUVNiYWIwNHJtd0RnS1ZHQzVuc1piS21wYW5kRU1XWEt4cStI?=
 =?utf-8?B?QnBqRlFyZWtJNTgxZ2RUeWVETndRODJWMFVVelZDYTZrN2R2WjQrWHVKaTlQ?=
 =?utf-8?B?Z1lHeFpIUkRKOHorUW1OWGJockt0K3BDbDNmUy9xdms3bVV6NmE0b1dmTFVV?=
 =?utf-8?B?YmF0dUtwbElCZWVxS0Y2SW5UR2NlUFhpb2xOUG5vNTlwam82UlB1R3RSUVV5?=
 =?utf-8?B?OFB1SlM5ajd0dUZpSDNaUlhsQlZUOEU4bHJiQWJObzFIRXBSU1prUkVjV2Ix?=
 =?utf-8?B?VWhFUHRxa0djdEE1aWJuWlI3UFU3K2c1Z3orSWJHVHZaaGJKbkVRVkZka0Fs?=
 =?utf-8?B?MjRJS3h5Y28wbnBUOU9sOFFVeDRrbUhNUmlYdS9VL1dia0I1Y2hQWFFBL2tk?=
 =?utf-8?B?ZitIQ3pjTmQybE9wNlVsZ2hsblhvNVkwcGl0akRKaFVaUnlpRzRUbXd2UVRo?=
 =?utf-8?B?WHR4L3luejg0cHFsVFlRbWZnQjV0M1BXK1lvT3RQekZPNm1vQnpkLzJaTm5W?=
 =?utf-8?B?UXhHL01DOFNLSjI4VVkwYU9qdW05VXh6MWVtTkpkOEhpdFU3b1pwd0U0T3U0?=
 =?utf-8?B?RWRLYk1tOUFtMy9FVm1VWTQ3NTVrUk9naXZBMDZZd2ZTTFdTWVYwNlAwLy93?=
 =?utf-8?B?YnJaZnBpSUhjUCs2ZlBpL2V3ZTNMYVV6NklEbVQ1YytIaVF6R3FTdHVlbW54?=
 =?utf-8?B?YnNMZURXRjZ0QzFVeit2ZHZQejBMRTg1THdKRXNGTWxCNk5sa0RQMWhqV2hs?=
 =?utf-8?B?a3Z5L0Y3RmszR0VPVFROWC9HYW1mYWN6MTRKck8wd1ZOUDhnTG5KV0pZRzM4?=
 =?utf-8?B?Y0loQytaOGp0Y3pVZ2lSaER5aEozSnhDaVBpNHBaazZTTnhEZWRtTWpRYkx6?=
 =?utf-8?Q?rBVgUKdbyeurcSu4BWpqqwiMH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5037.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7183c6c2-02a1-493e-4b49-08dd999aca55
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 01:40:25.4693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qb30d0mJP98riL/SzV6Xayolz15t0fTmGs4MCYCMyZnmyl6C5dfWIPX/p9StlRwYAyNJqCkaDLAYs0ko4m5nvABPSErVyUXxjNn+ZqzKG2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFF9F12DF7E
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 01:40:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6883

SGkgQW50b25pbiwNCg0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFtQQVRDSCB2MV0gcmVmLW1hbnVh
bDogdWJvb3Qtc2lnbjogU3VwcG9ydCBmaXJtd2FyZQ0KPiBwcm9wZXJ0eSBpbiBGSVQgY29uZmln
DQo+IA0KPiBIaSwNCj4gDQo+IE9uIFR1ZSBNYXkgMjAsIDIwMjUgYXQgMTE6NTQgQU0gQ0VTVCwg
SmFtaW4gTGluIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IHdyb3RlOg0KPiA+IEFkZCBk
b2N1bWVudGF0aW9uIGZvciB0aGUgVUJPT1RfRklUX0NPTkZfRklSTVdBUkUgdmFyaWFibGUsIHdo
aWNoDQo+ID4gYWxsb3dzIHVzZXJzIHRvIHNwZWNpZnkgYW4gaW1hZ2UgdG8gYmUgYXNzaWduZWQg
dG8gdGhlICJmaXJtd2FyZSINCj4gPiBwcm9wZXJ0eSBvZiB0aGUgRklUIGNvbmZpZ3VyYXRpb24g
bm9kZS4gVGhpcyBleHBsaWNpdGx5IGRlZmluZXMgdGhlDQo+ID4gcHJpbWFyeSBpbWFnZSB0byBi
b290LCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gdGhlIGZpcnN0IGVudHJ5IGluIHRoZSAibG9hZGFi
bGVzIg0KPiBsaXN0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFtaW4gTGluIDxqYW1pbl9s
aW5AYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIGRvY3VtZW50YXRpb24vcmVmLW1hbnVh
bC9jbGFzc2VzLnJzdCAgIHwgMiArKw0KPiA+ICBkb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFy
aWFibGVzLnJzdCB8IDggKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL2Ns
YXNzZXMucnN0DQo+ID4gYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvY2xhc3Nlcy5yc3QNCj4g
PiBpbmRleCA1MTg3MDMzZjcuLjU0YTk4YmYyNCAxMDA2NDQNCj4gPiAtLS0gYS9kb2N1bWVudGF0
aW9uL3JlZi1tYW51YWwvY2xhc3Nlcy5yc3QNCj4gPiArKysgYi9kb2N1bWVudGF0aW9uL3JlZi1t
YW51YWwvY2xhc3Nlcy5yc3QNCj4gPiBAQCAtMzQyNiw2ICszNDI2LDggQEAgVGhlIHZhcmlhYmxl
cyB1c2VkIGJ5IHRoaXMgY2xhc3MgYXJlOg0KPiA+ICAtICA6dGVybTpgVUJPT1RfRklUX1VTRVJf
U0VUVElOR1NgOiBhZGRzIGEgdXNlci1zcGVjaWZpYyBzbmlwcGV0IHRvIHRoZQ0KPiBVLUJvb3QN
Cj4gPiAgICAgSW1hZ2UgVHJlZSBTb3VyY2UgKElUUykuIFVzZXJzIGNhbiBpbmNsdWRlIHRoZWly
IGN1c3RvbSBVLUJvb3QgSW1hZ2UNCj4gVHJlZQ0KPiA+ICAgICBTb3VyY2UgKElUUykgc25pcHBl
dCBpbiB0aGlzIHZhcmlhYmxlLg0KPiA+ICstICA6dGVybTpgVUJPT1RfRklUX0NPTkZfRklSTVdB
UkVgOiBhZGRzIG9uZSBpbWFnZSB0byB0aGUNCj4gYGBmaXJtd2FyZWBgIHByb3BlcnR5DQo+ID4g
KyAgIG9mIHRoZSBjb25maWd1cmF0aW9uIG5vZGUuDQo+ID4gIC0gIDp0ZXJtOmBVQk9PVF9GSVRf
Q09ORl9VU0VSX0xPQURBQkxFU2A6IGFkZHMgb25lIG9yIG1vcmUNCj4gdXNlci1kZWZpbmVkIGlt
YWdlcw0KPiA+ICAgICB0byB0aGUgYGBsb2FkYWJsZXNgYCBwcm9wZXJ0eSBvZiB0aGUgY29uZmln
dXJhdGlvbiBub2RlLg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24vcmVmLW1h
bnVhbC92YXJpYWJsZXMucnN0DQo+ID4gYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFi
bGVzLnJzdA0KPiA+IGluZGV4IDY0M2EzZTdhZS4uYjQzMGZhNTFmIDEwMDY0NA0KPiA+IC0tLSBh
L2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0DQo+ID4gKysrIGIvZG9jdW1l
bnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4gPiBAQCAtMTAzMjcsNiArMTAzMjcs
MTQgQEAgc3lzdGVtIGFuZCBnaXZlcyBhbiBvdmVydmlldyBvZiB0aGVpciBmdW5jdGlvbg0KPiBh
bmQgY29udGVudHMuDQo+ID4NCj4gPiAgICAgICAgICAgZG9fY29tcGlsZVtkZXBlbmRzXSArPSAi
dHJ1c3RlZC1maXJtd2FyZS1hOmRvX2RlcGxveSINCj4gPg0KPiA+ICsgICA6dGVybTpgVUJPT1Rf
RklUX0NPTkZfRklSTVdBUkVgDQo+ID4gKyAgICAgIEFkZHMgb25lIGltYWdlIHRvIHRoZSBgYGZp
cm13YXJlYGAgcHJvcGVydHkgb2YgdGhlIGNvbmZpZ3VyYXRpb24NCj4gbm9kZQ0KPiA+ICsgICAg
ICBvZiB0aGUgVS1Cb290IEltYWdlIFRyZWUgU291cmNlIChJVFMpLiBTZXRzIHRoZSBmaXJtd2Fy
ZSBwcm9wZXJ0eSB0bw0KPiBzZWxlY3QNCj4gPiArICAgICAgdGhlIGltYWdlIHRvIGJvb3QgZmly
c3QuIElmIG5vdCBzZXQsIHRoZSBmaXJzdCBlbnRyeSBpbiAibG9hZGFibGVzIiBpcw0KPiB1c2Vk
DQo+ID4gKyAgICAgIGluc3RlYWQuOjoNCj4gDQo+IEV4dHJhICIuIiBoZXJlLg0KPiANCg0KV2ls
bCBmaXgNCg0KPiBXaGVuIHlvdSB3cml0ZToNCj4gDQo+ICIiIg0KPiBUaGUgZmlyc3QgZW50cnkg
aW4gImxvYWRhYmxlcyIgaXMgdXNlZCBpbnN0ZWFkICIiIg0KPiANCj4gSXQncyBub3QgcmVhbGx5
IGNsZWFyIHRvIG1lIHdoYXQgaXQgaXMgdXNlZCBmb3IuDQo+IFVzZWQgdG8gYm9vdD8NCj4gDQoN
CkV4YW1wbGU6MQ0KDQpjb25maWd1cmF0aW9ucyB7DQogICAgICAgIGRlZmF1bHQgPSAiY29uZiI7
DQogICAgICAgIGNvbmYgew0KICAgICAgICAgICAgZmlybXdhcmUgPSAiZndBIjsNCiAgICAgICAg
ICAgIGxvYWRhYmxlcyA9ICJmd0IiLCAiZndDIiwgImZ3RCI7DQogICAgICAgIH07DQp9Ow0KDQpC
b290IGZ3QQ0KDQpFeGFtcGxlOjINCg0KY29uZmlndXJhdGlvbnMgew0KICAgICAgICBkZWZhdWx0
ID0gImNvbmYiOw0KICAgICAgICBjb25mIHsNCiAgICAgICAgICAgIGxvYWRhYmxlcyA9ICJmd0Ii
LCAiZndDIiwgImZ3RCI7DQogICAgICAgIH07DQp9Ow0KDQpCb290IGZ3Qg0KDQpFeGFtcGxlOjMN
Cg0KY29uZmlndXJhdGlvbnMgew0KICAgICAgICBkZWZhdWx0ID0gImNvbmYiOw0KICAgICAgICBj
b25mIHsNCiAgICAgICAgICAgIGxvYWRhYmxlcyA9ICJmd0EiICJmd0IiLCAiZndDIiwgImZ3RCI7
DQogICAgICAgIH07DQp9Ow0KDQpCb290IGZ3QQ0KDQpUaGFua3MtSmFtaW4NCg0KPiA+ICsNCj4g
PiArICAgICAgICAgVUJPT1RfRklUX0NPTkZfRklSTVdBUkUgPSAiZndhIg0KPiA+ICsNCj4gPiAg
ICAgOnRlcm06YFVCT09UX0ZJVF9DT05GX1VTRVJfTE9BREFCTEVTYA0KPiA+ICAgICAgICBBZGRz
IG9uZSBvciBtb3JlIHVzZXItZGVmaW5lZCBpbWFnZXMgdG8gdGhlIGBgbG9hZGFibGVzYGAgcHJv
cGVydHkNCj4gb2YgdGhlDQo+ID4gICAgICAgIGNvbmZpZ3VyYXRpb24gbm9kZSBvZiB0aGUgVS1C
b290IEltYWdlIFRyZWUgU291cmNlIChJVFMpLiBUaGlzDQo+ID4gdmFyaWFibGUNCj4gDQo+IA0K
PiBBbnRvbmluDQo+IA0KPiAtLQ0KPiBBbnRvbmluIEdvZGFyZCwgQm9vdGxpbg0KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

