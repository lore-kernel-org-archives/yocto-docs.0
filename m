Return-Path: <jaekyu.lee@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618EDCDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:01:06 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6573.1782374458032389558
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaekyu.lee@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 25 Jun 2026 17:00:55 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: jaekyu.lee@lge.com
Received: from unknown (HELO sniperexo3.lge.com) (165.244.147.13)
	by 156.147.1.126 with ESMTP; 25 Jun 2026 17:00:55 +0900
X-Original-SENDERIP: 165.244.147.13
X-Original-MAILFROM: jaekyu.lee@lge.com
Received: from unknown (HELO SLXP216CU001.outbound.protection.outlook.com) (40.93.138.24)
	by 165.244.147.13 with ESMTP; 25 Jun 2026 17:00:55 +0900
X-Original-SENDERIP: 40.93.138.24
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaekyu.lee@lge.com
X-Original-RCPTTO: quentin.schulz@cherry.de,
	docs@lists.yoctoproject.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBJ6sKv0KaFhWoVIrvh23+W4NsgOIXRByqdzSTEaWrelhhYlfP/tReb5fBlnn5V2o71hZdo/zJkfLtmr2Z+MNvhJg54KFQulOaJE1wjOs6H3jzCxL2aV+fBA0928HDWZVObCOTBEzZQ8KWfc6/6iVPlnAYmIvXBbcwkkcyCyKVZfF8mr/uHCRYYUdZXBi2WK/W+mj8khAG+k2ogdOEMgSekbJFq++P9ecyAbf2vRVCWK3Sjp5fIHaPAIB7bbGwLesqjhfj+9YCZt/+K1j5305VLTQVUN1LN5cINdAcACle373W6UI0xVsYn2zcZGJT5aUr5yr8oqH4Y/+4uMTljmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72kOGuuqU+9tlusi5QNwsQ63l2aHvX/OW751H0h6+vg=;
 b=ft7fFPHys2FEI1Prypm7sVJx2jrOApVaQaHguIrDTCZdrzRZlk5V1O4HswbVfY94LJyYAUHfRKm8ocPgfF2YVkZLUIzCE1ZL7H3akqOIvKesdXkO3yTof17bmjAKv9/le6Sc96M2lRuITvPp84MgM4idBhgjRdVIEIkcHjobxEJizLMMV1kM6Y/+OXBkTG6kPlZZCdQZGvxByDB8zDueuTaeib8DZuGt/awS/Nly1Ro29IRgMLIfFx1/q4XsY+mjtXynzPjowm+xiC29A36IRLybeU38XMz3xrM28UmLXzeyJ4x+a2rc8wiW2dEdXVlPvYaIAryXct/HU5STbUlyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from SE5P216MB3342.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fc::15)
 by SE5P216MB397295.KORP216.PROD.OUTLOOK.COM (2603:1096:101:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 08:00:54 +0000
Received: from SE5P216MB3342.KORP216.PROD.OUTLOOK.COM
 ([fe80::f717:5d28:dc07:615f]) by SE5P216MB3342.KORP216.PROD.OUTLOOK.COM
 ([fe80::f717:5d28:dc07:615f%4]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 08:00:54 +0000
From: =?ks_c_5601-1987?B?wMzA57HUL8OlwNO/rLG4v/gvvLHH4MfDt6fG+7Czud/GwA==?=
	<jaekyu.lee@lge.com>
To: Quentin Schulz <quentin.schulz@cherry.de>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
CC: =?ks_c_5601-1987?B?waSwx8DPL8bAwOUvvLHH4MfDt6fG+7Czud/GwA==?=
	<keonil.jeong@lge.com>,
	=?ks_c_5601-1987?B?vNXH9rz2L8OlwNO/rLG4v/gvvLHH4MfDt6fG+7Czud/GwA==?=
	<earnest.son@lge.com>
Subject: Re: [docs] [PATCH] migration-guide: 5.1: Remove duplicated typo
Thread-Topic: [docs] [PATCH] migration-guide: 5.1: Remove duplicated typo
Thread-Index: AQHdA76OontmiBQiqEuJLDoHU3G+jbZNdlAAgAAFMac=
Date: Thu, 25 Jun 2026 08:00:54 +0000
Message-ID: 
 <SE5P216MB33426734DADB1BEE4E1C9FAC90ED2@SE5P216MB3342.KORP216.PROD.OUTLOOK.COM>
References: <20260624094747.3447103-1-jaekyu.lee@lge.com>
 <d2292a79-16a9-4786-9b69-30d7d320de50@cherry.de>
In-Reply-To: <d2292a79-16a9-4786-9b69-30d7d320de50@cherry.de>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE5P216MB3342:EE_|SE5P216MB397295:EE_
x-ms-office365-filtering-correlation-id: fb2702ad-7176-4507-c290-08ded28fe1c1
x-ld-processed: 5069cde4-642a-45c0-8094-d0c2dec10be3,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003|8096899003|6133799003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 Gw5Wol6E8QP1gxluqu3IJHe0DWMBhuvE+1sFHDe1NmZROzaSHW8IsxHcimkz2tuZo868naJ2IMj/Q+iSh63N7vbs+3QXhP0txGTaD8LNVuXwZpWzgGqZtJCeh7nC4fcDyhCZvdazQNBiGkP8pohwlsPrl/iADSDSYOxK5tK+9rxwkr2vdf5+S0QS31KXWvzluhnMQxzNcLuWZWpVcyFlFFK0+Hoa2hdJjBp9qqTp5j+QUS7vcepYfpJgIQAYgLUjLb5SwPMo3n6CtdaIo8i6Vy1BALhQOQKHdNamrVyRpznOuqbn0e0NOJauuDtK/XwN9yNNE+s8eOhRLDvu+IvW8v8VBXmxvvbvUgevvz1YAWQfCOzts/YoL39oSLpa0/lVECBaUUeqqVl37dLwGJ9K9GjTPB7YKyJruveARga/ezQthMKJaZlqmChq7yoSIbL3eMF4xPi3SmHaXpuHmYIbywJjK/AExBQh2yJ0Na7gRs7A0UK7pwuUN/feo2iu+rUWZ3qrXeXO+kMCnqIlva8tQH3xWWh9ayWLxtInWjJwXp7zOaj6MrHgBxETHbSbobGSRqxjyjzYBLi3lfYvZnwWuCbciLdBPszeLuK1e2Q7UeqevfnM/yp/eEZlYOcXEK2cnGraZG57QkQVoan8Vym9IdLdr6tJxBtC/WjZ6LhRsCE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE5P216MB3342.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(8096899003)(6133799003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?eVBMaFpqMnNVSmx2b1o4RmxzczAxK2xzbUo3bDZyaDZTMlhLc2xr?=
 =?ks_c_5601-1987?B?ZXRlb1hkRDltam1zSDZkTmNmY2xOQVVMQUdXRXhvRkRrbkptSTJV?=
 =?ks_c_5601-1987?B?T0tXMDFwMGNWd0Y3UEp1WXY1cjVhaSt1OVMvQWJ4Lzc2NklnRSsx?=
 =?ks_c_5601-1987?B?dEdKYnRjMzR2WFMyNktFNVhLTFJlV0hCa3YyWkdWcXczZlJlWFJh?=
 =?ks_c_5601-1987?B?QUdVSFl4QnBXdHBpWnhaUjU1b1E0OXByZUVCWmszekp5MTJGWWhy?=
 =?ks_c_5601-1987?B?UFN3azlUb1RQNWIrTEhLTjlwRVNJWFdVK1VSUnRNZzJKU28vZWxi?=
 =?ks_c_5601-1987?B?dnZqNHU0WjdmY3hrVG9xNWVPOUE1ejFnOWNReTJkUXRCVXRwK2k2?=
 =?ks_c_5601-1987?B?ZVJvUUJCRXhNN3p0ZERmd0hkRjVnb21GcCtRZlI0VktUby9qVWJv?=
 =?ks_c_5601-1987?B?VDJRRXVTTExwSHFYS2tTM1g3RVAxVHVzQ3UwV2kvVy80UFFROS9r?=
 =?ks_c_5601-1987?B?dFR2T210LzAyNnNRdXZzVlFkd2hQR0Y1SDB0ODB6UFBLbGxQbGow?=
 =?ks_c_5601-1987?B?dnZOSm5YRWpHSDlUTkIyNmdjOGJFWFdTTjV0YVg2YmRrTEhFTlNy?=
 =?ks_c_5601-1987?B?U3oxMEE3Z2w5QlFWTWJEOWhqSEZxdXVYV1VYUXg3WjgvbE9WWVVl?=
 =?ks_c_5601-1987?B?MmdRZ1dlVTY2cUxwNU03dUtMbE9FQW14K1RZU2tjYS9jV1N2czlw?=
 =?ks_c_5601-1987?B?alRxa2NJNlNVOERhOVVGR3YrRmw0clBKZVBpNkN4SnN4cEJjYTZE?=
 =?ks_c_5601-1987?B?ZkNQQTVBQUhBRTBXbDNYV2RRVG5aZTdZWFJ3Q1g2SDlkWWhnT2hC?=
 =?ks_c_5601-1987?B?b2MzSFZCeWgrWEJRRnFHUUpBV2NPblNWU1pHeTJuYTZjVTVnUE5Z?=
 =?ks_c_5601-1987?B?ZlVDY3BJZjZRM056b3kvY2tGejBld0RiV1RlUVlPTmtSbWpIcmFP?=
 =?ks_c_5601-1987?B?UG1nb0NDOU1nR3RJTnkwa0drUUR6Q3VZQ0JLcmZLYmpwTTU2aDh1?=
 =?ks_c_5601-1987?B?ZzlZcnJtRHFXcHh2SXpNQXVlTC9nQlgwSHBEWW4vbDJuZ2tpOWx6?=
 =?ks_c_5601-1987?B?a2JDVGFxNU5XRnlEK2E3K25DRk45SkxnU3NoRGVUSFR3L3NVVXJH?=
 =?ks_c_5601-1987?B?Y3hGSVB0bjJkSzdvV2REU2pmWW5od2dtTmpPUFhMYjdQamVXbVVl?=
 =?ks_c_5601-1987?B?dklZUVoxOGpTc3BJdGdsU1ZoSTRMMTBkanh0WDNoNks3V1o4am1j?=
 =?ks_c_5601-1987?B?NExxazBMUTFqd0V3TGxWWFRhWmYxQk13djN1b2swMkJyK09manZF?=
 =?ks_c_5601-1987?B?L1IyQ2Q4WWRjSXhpdTVMemk2SFVZWDNaWGl0SmFrbUg2WDJHRHdK?=
 =?ks_c_5601-1987?B?bEFFUTAwYUQzOGYrMWNNaXd0MklLVlFlUTNSSXcvSEhwMXdMVldN?=
 =?ks_c_5601-1987?B?eEZydlRIa2RiY1kwZ3g0ZnZmUElvN3pNL0s5UGhxZTJGZkxkdWRL?=
 =?ks_c_5601-1987?B?dnJ5NlZZU1dLa2Jzc01IMm1lVWVCY2MyWG1NcGxwZlhLa0FVT3BS?=
 =?ks_c_5601-1987?B?Qzd3U3NwSEl2TjhDenJVeEVuamdpTzFNbnhIR0hXQzBvU0tBT0VS?=
 =?ks_c_5601-1987?B?NmNBaHNYdjh2ZjVtOFZ4dDVpeVBOdDcxdDdta29EeUFRR1RTd25x?=
 =?ks_c_5601-1987?B?TnJqZWllTFl5cW9kWGFwcUY4WGRLNi9GMHYvZVdJU1NMUXZlSVZ5?=
 =?ks_c_5601-1987?B?R0VTdHBGTEhMZmNTNnhGOUtzMmFUK0FNdHFZaTBVdTF0bG9VSUh5?=
 =?ks_c_5601-1987?B?YzBXYlh6bDZyYUoxVjFIWFZxaVdHYXV3bm1qbXJYRS9SY2xWc2l1?=
 =?ks_c_5601-1987?B?WitXdUl4WnIxVXhRK1FDaFE1Y0VMVXpuUVMzY3BiUXAvRWp4ZzZV?=
 =?ks_c_5601-1987?B?Zzh4bWt3RFU5RnRNYkZ3TkpRT282K3NXcER4WFRmVEdHUnRKei8w?=
 =?ks_c_5601-1987?B?VTVGc2FSZlo4UmtiMzcweldiMW5hdFpWenhGeDRDRzNDMk5vMmw2?=
 =?ks_c_5601-1987?B?Q1NBd2I2cHg0MHBhSHNDcEl6ZUpuMk9CUG01U2k1eXhNSlQ2cjVx?=
 =?ks_c_5601-1987?B?QVdHSUEzVGRQS2pIRTNaSGlVQXZ0QXFNQkFQYjEvNDdCWjZmTFBp?=
 =?ks_c_5601-1987?B?c2lHMzd1ZW1XRnRiV3hyY2kreExmMlh6Tks4Y2FRZ0hyaFVlbGww?=
 =?ks_c_5601-1987?B?MkpRV3E3UE0xanlscHl4end2S0s0NjhxN2Q3WUFyTnpyWVFoWmlK?=
 =?ks_c_5601-1987?B?b0RtK0E5Ty9abklZYjRKTE1KSUdhdURsMVFxWUR2S0lpN0xoVjZ0?=
 =?ks_c_5601-1987?B?MlZuWHBMZEN0bGdDMVcxWlcwY2pjYmVmQWczRWhTeUNoODlHMFpU?=
 =?ks_c_5601-1987?B?RmtPcEdxWVQ1YmRlOE82dnQvaUs2K2tUNllnSXNIWTNJbmU1bENI?=
 =?ks_c_5601-1987?B?dWdYaXllc1YvZ0lrR1d0K01MWGY2R045TDl3dDNUUW1WSkF0N0Jm?=
 =?ks_c_5601-1987?B?NWVCVVNCODhGQlRPc2gxYWlmbDBFdENIZzVKYmJEL2dMeDNOYWFw?=
 =?ks_c_5601-1987?Q?E5b+Nh8iLkHq?=
Content-Type: multipart/alternative;
	boundary="_000_SE5P216MB33426734DADB1BEE4E1C9FAC90ED2SE5P216MB3342KORP_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	L3dQsSawZWuvfp3vv6/8lX2JYYbodiQ31YKBYGOPqdJHg1nxzTPMwo7Dx1oWBIL0ojQPZJOWQCAWrJ0jP7TGza79BZpAWL8iSPtbeM7A88dhN6RNtofoDlinhoXm4gD1BqohXif5NPIdIPTADlZCDbEgSLbn3deuYMwrftv7Edq4tdMs+3o8/vDYtciqcAGrFuMvxI52yNwYVgi7nQZq3IxuYdzn9nQUQHQUqjXmKHXUNYIVsqbcCArkYVOq4bgjrRNrnLZX0eeumKqjBRRVfVNaG7Tu6COC5M+/0LR+21fhbhsasw6l7zT/yIWRMRsD9SoC4MDTj9/jVtLbt5s1/Q==
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE5P216MB3342.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2702ad-7176-4507-c290-08ded28fe1c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 08:00:54.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9nVTmSyQ3nBf2FtT6vDH8SPH9yrfPjI70YxpiZPPXjjcoOkdLKEPkjiuSPmdkkV7owEuw7PX/c0oKmH/7Dsjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB397295
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:01:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9871

--_000_SE5P216MB33426734DADB1BEE4E1C9FAC90ED2SE5P216MB3342KORP_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGkgUXVlbnRpbiwgQW50b25pbg0KVGhhbmtzIGZvciByZXZpZXcuDQoNCmlmIGludGVudGlvbiBp
cyBkb19jb25maWd1cmUsIHRoZW4gSSB3aWxsIGZpeCBteSBwYXRjaGVzLg0KDQpCdXQsIGxvb2tp
bmcgYXQgdGhlIG5leHQgcGFyYWdyYXBoLCBpdCBvbmx5IG1lbnRpb25zIGRvX2NvbXBpbGUgYW5k
IGRvX2luc3RhbGwsIHNvIEkgdGhvdWdodCBpdCB3YXMgcmVkdW5kYW50IGFuZCBtYWRlIGEgcGF0
Y2guDQoNCiJUaGVzZSBhcmUgY29tbW9ubHkgaW4gZG9fY29tcGlsZTxodHRwczovL2RvY3MueW9j
dG9wcm9qZWN0Lm9yZy9yZWYtbWFudWFsL3Rhc2tzLmh0bWwjcmVmLXRhc2tzLWNvbXBpbGU+IGFu
ZCBkb19pbnN0YWxsPGh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qub3JnL3JlZi1tYW51YWwvdGFz
a3MuaHRtbCNyZWYtdGFza3MtaW5zdGFsbD4gZm9yIHRoaW5ncyBsaWtlIHNlcnZpY2Ugb3IgY29u
ZmlndXJhdGlvbiBmaWxlcyINCg0KQW55d2F5ICwgbGV0IG1lIGtub3cgeW91ciBpbnRlbnRpb25z
Lg0KDQpUaGFua3MsDQpqYWVreXUNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KurizvSC757b3OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPg0K
urizvSCzr8KlOiAyMDI2s+IgNr/5IDI0wM8gvPa/5MDPIL/AyMQgNjo1MA0Kud60wiC757b3OiDA
zMDnsdQvw6XA07+ssbi/+C+8scfgx8O3p8b7sLO538bAIDxqYWVreXUubGVlQGxnZS5jb20+OyBk
b2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4N
CsGmuPE6IFJlOiBbZG9jc10gW1BBVENIXSBtaWdyYXRpb24tZ3VpZGU6IDUuMTogUmVtb3ZlIGR1
cGxpY2F0ZWQgdHlwbw0KDQpIaSBqYWVreXUubGVlLCBBbnRvbmluLA0KDQpPbiA2LzI0LzI2IDEx
OjQ3IEFNLCBKYWVreXUgTGVlIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0KPiBb
WW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGphZWt5dS5sZWU9bGdlLmNvbUBsaXN0cy55
b2N0b3Byb2plY3Qub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gRnJvbTogImphZWt5
dS5sZWUiIDxqYWVreXUubGVlQGxnZS5jb20+DQo+DQo+IC0gUmVtb3ZlIGR1cGxpY2F0ZWQgdHlw
bywgZG9fY29tcGlsZQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBqYWVreXUubGVlIDxqYWVreXUubGVl
QGxnZS5jb20+DQo+IC0tLQ0KPiAgIGRvY3VtZW50YXRpb24vbWlncmF0aW9uLWd1aWRlcy9taWdy
YXRpb24tNS4xLnJzdCB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL21pZ3Jh
dGlvbi1ndWlkZXMvbWlncmF0aW9uLTUuMS5yc3QgYi9kb2N1bWVudGF0aW9uL21pZ3JhdGlvbi1n
dWlkZXMvbWlncmF0aW9uLTUuMS5yc3QNCj4gaW5kZXggOTRiNTI3YmRjLi5mMWM5NTNjN2UgMTAw
NjQ0DQo+IC0tLSBhL2RvY3VtZW50YXRpb24vbWlncmF0aW9uLWd1aWRlcy9taWdyYXRpb24tNS4x
LnJzdA0KPiArKysgYi9kb2N1bWVudGF0aW9uL21pZ3JhdGlvbi1ndWlkZXMvbWlncmF0aW9uLTUu
MS5yc3QNCj4gQEAgLTIzLDggKzIzLDggQEAgc3VwcG9ydGVkLCBhbmQgYW4gZXJyb3Igd2lsbCBi
ZSBpc3N1ZWQuIFRoZSByZWNpcGUgc2hvdWxkIGJlIGNoYW5nZWQgdG86Og0KPiAgICAgICBTID0g
IiR7VU5QQUNLRElSfSINCj4NCj4gICBBbnkgOnRlcm06YFdPUktESVJgIHJlZmVyZW5jZXMgd2hl
cmUgZmlsZXMgZnJvbSA6dGVybTpgU1JDX1VSSWAgYXJlIHJlZmVyZW5jZWQNCj4gLXNob3VsZCBi
ZSBjaGFuZ2VkIHRvIDp0ZXJtOmBTYC4gVGhlc2UgYXJlIGNvbW1vbmx5IGluIDpyZWY6YHJlZi10
YXNrcy1jb21waWxlYCwNCj4gLTpyZWY6YHJlZi10YXNrcy1jb21waWxlYCwgOnJlZjpgcmVmLXRh
c2tzLWluc3RhbGxgIGFuZCA6dGVybTpgTElDX0ZJTEVTX0NIS1NVTWAuDQo+ICtzaG91bGQgYmUg
Y2hhbmdlZCB0byA6dGVybTpgU2AuIFRoZXNlIGFyZSBjb21tb25seSBpbiA6cmVmOmByZWYtdGFz
a3MtY29tcGlsZWAsDQo+ICs6cmVmOmByZWYtdGFza3MtaW5zdGFsbGAgYW5kIDp0ZXJtOmBMSUNf
RklMRVNfQ0hLU1VNYC4NCj4NCg0KQXNraW5nIHRoZSBzYW1lIHF1ZXN0aW9uIHNpbmNlIGl0IHdh
cyBpZ25vcmVkIG9uIHYxIHN1Y2ggdGhhdCBBbnRvbmluIGlzDQphd2FyZSBvZiBpdC4gSSBhbSB3
b25kZXJpbmcgd2hldGhlciB3ZSBkaWRuJ3QgcmF0aGVyIG1lYW4gY29uZmlndXJlLA0KY29tcGls
ZSBhbmQgaW5zdGFsbCB0YXNrcyBpbnN0ZWFkIG9mIHRoZSBjb21waWxlIHRhc2sgYmVpbmcgZHVw
bGljYXRlZC4NCg0KQ2hlZXJzLA0KUXVlbnRpbg0K

--_000_SE5P216MB33426734DADB1BEE4E1C9FAC90ED2SE5P216MB3342KORP_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Quentin, Antonin</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
if intention is do_configure, then I will fix my patches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
But, looking at the next paragraph, it only mentions do_compile and do_inst=
all, so I thought it was redundant and made a patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&quot;These are commonly in <span style=3D"color: rgb(68, 68, 68);"><a href=
=3D"https://docs.yoctoproject.org/ref-manual/tasks.html#ref-tasks-compile" =
id=3D"OWAdb0fd703-ca9c-224d-1bc4-e8369dfd2acb" class=3D"reference internal =
OWAAutoLink" style=3D"color: rgb(68, 68, 68); text-align: left;"><u>do_comp=
ile</u></a></span>&nbsp;and
<span style=3D"color: rgb(68, 68, 68);"><a href=3D"https://docs.yoctoprojec=
t.org/ref-manual/tasks.html#ref-tasks-install" id=3D"OWA1e2e476d-eefc-76e0-=
7c2a-780568b5db23" class=3D"reference internal OWAAutoLink" style=3D"color:=
 rgb(68, 68, 68); text-align: left;"><u>do_install</u></a></span>&nbsp;for
 things like service or configuration files&quot;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Anyway , let me know your intentions.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
jaekyu&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>=BA=B8=B3=BD =BB=E7=B6=F7:</b>&nbsp;Quentin Schulz &lt;quentin.schulz@ch=
erry.de&gt;<br>
<b>=BA=B8=B3=BD =B3=AF=C2=A5:</b>&nbsp;2026=B3=E2 6=BF=F9 24=C0=CF =BC=F6=
=BF=E4=C0=CF =BF=C0=C8=C4 6:50<br>
<b>=B9=DE=B4=C2 =BB=E7=B6=F7:</b>&nbsp;=C0=CC=C0=E7=B1=D4/=C3=A5=C0=D3=BF=
=AC=B1=B8=BF=F8/=BC=B1=C7=E0=C7=C3=B7=A7=C6=FB=B0=B3=B9=DF=C6=C0 &lt;jaekyu=
.lee@lge.com&gt;; docs@lists.yoctoproject.org &lt;docs@lists.yoctoproject.o=
rg&gt;<br>
<b>=C1=A6=B8=F1:</b>&nbsp;Re: [docs] [PATCH] migration-guide: 5.1: Remove d=
uplicated typo</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">Hi jaekyu.lee, Antonin,<br>
<br>
On 6/24/26 11:47 AM, Jaekyu Lee via lists.yoctoproject.org wrote:<br>
&gt; [You don't often get email from jaekyu.lee=3Dlge.com@lists.yoctoprojec=
t.org. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" id=3D"OWA9e9d472a=
-5d54-4246-a405-7e1b180b2f3f" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble">
https://aka.ms/LearnAboutSenderIdentification</a>&nbsp;]<br>
&gt;<br>
&gt; From: &quot;jaekyu.lee&quot; &lt;jaekyu.lee@lge.com&gt;<br>
&gt;<br>
&gt; - Remove duplicated typo, do_compile<br>
&gt;<br>
&gt; Signed-off-by: jaekyu.lee &lt;jaekyu.lee@lge.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; documentation/migration-guides/migration-5.1.rst | 4 ++--<=
br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/migration-guides/migration-5.1.rst b/docume=
ntation/migration-guides/migration-5.1.rst<br>
&gt; index 94b527bdc..f1c953c7e 100644<br>
&gt; --- a/documentation/migration-guides/migration-5.1.rst<br>
&gt; +++ b/documentation/migration-guides/migration-5.1.rst<br>
&gt; @@ -23,8 +23,8 @@ supported, and an error will be issued. The recipe s=
hould be changed to::<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S =3D &quot;${UNPACKDIR}&quot;<br>
&gt;<br>
&gt;&nbsp;&nbsp; Any :term:`WORKDIR` references where files from :term:`SRC=
_URI` are referenced<br>
&gt; -should be changed to :term:`S`. These are commonly in :ref:`ref-tasks=
-compile`,<br>
&gt; -:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FIL=
ES_CHKSUM`.<br>
&gt; +should be changed to :term:`S`. These are commonly in :ref:`ref-tasks=
-compile`,<br>
&gt; +:ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.<br>
&gt;<br>
<br>
Asking the same question since it was ignored on v1 such that Antonin is<br=
>
aware of it. I am wondering whether we didn't rather mean configure,<br>
compile and install tasks instead of the compile task being duplicated.<br>
<br>
Cheers,<br>
Quentin</div>
</body>
</html>

--_000_SE5P216MB33426734DADB1BEE4E1C9FAC90ED2SE5P216MB3342KORP_--

