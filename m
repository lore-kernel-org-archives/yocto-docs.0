Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8888C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:18:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.59])
 by mx.groups.io with SMTP id smtpd.web10.36058.1749223094635980347
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 08:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=kKPgyut1;
 spf=pass (domain: siemens.com, ip: 52.101.66.59, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNdAH6y9fEwEZcPJ1NKWzhjmaCMFjEn9Lhr/XYP2aHx74rgdi8ggog2tinkthM1jctRolS3U6W3XNniokoi8B7ROotB5ceYJEqmvKZWzqtLfeQcko+v+8A6D7Xitd3PyLgtUXCeNJZyR4uKzI8+XCgoYZAibh+XVRhd0VRHK4TLl/qRc+9pZSG1pwkmbMwnHa4ZSA+lgPh+3IDa6VOG/ePgHipVne005k1fxylN/ND33uzg9rQR2TmJpe2Abu44PqcBPfgs/3BaLVH3cxyTV5ELN2ImnMQUXzESeAZLdD7T/0BukjhfkGxyCCbV/8Ko1CCX/mncZ/Cr2+9tRn99eoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9z58WFcNEHeVGObSU7Pp/hxKy7wxwFtptLsoUt5pEE=;
 b=k3YN+5ebbtqbFWxLGMTRidGOhPBfAmTf8WOK/PG2Ki3Yg/Q8grwglBk/DgNWhKExiDMuTXtcCz2vsS8Geg6nCbZ10o+l79o5f6/EMg8mHSXY0M4fV65VVDtDuiixRzgUGSuc9Fh4EEodfGkgmuXCmcSRB8+yXBc7dwls0/9s94TeTDIJWQ73whg2AWP1LAWAGeyD/4mbzdhEoq2JpLmvbvOiFDgXVW00XMUmqRoufKogbs8QZraIAMROkFU2CbyXvyMV15wrol4/ISPjHmz8eLE9zrhRlCY3rUaTgEvqv+PHs3pxZa2Z5Q2Mnozj5Z537tgtbnbvJ5NnlQip19bcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9z58WFcNEHeVGObSU7Pp/hxKy7wxwFtptLsoUt5pEE=;
 b=kKPgyut1Z5JfGSSQkjiSAXktDvMNbX/8QtjVaJqwYpd0zj6RrBazzW1CJrQw0Aj/sMdMnCtuIyeL9Nd4nRTS9CRyIqDgwCx6dXZzovn4nPepDkGA8sZArhw05bFaJg57d9ueKG2IxtVZg9OkW4IhU/xY90r5GSp832BWRxj03viP5/CfJek2ifqLGtfp8c9Nh8UbLt49GvS40JDgPRe+4KfiePbGfGV8mE6ADgJEH+w197AXJUJmyGts22GJjdnOdSkjhn1BfOYjNg0bqklloplqZyO0frzuyTTotSbN3iPjNlLpJ4t30KhlQLm6ZKyXWTToSrhtQ8dPhKCAYQ7X6w==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DU4PR10MB8974.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:562::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 15:18:11 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 15:18:11 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "ejo@pengutronix.de" <ejo@pengutronix.de>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] conf.py: tweak SearchEnglish to be
 hyphen-friendly
Thread-Topic: [docs] [PATCH v2] conf.py: tweak SearchEnglish to be
 hyphen-friendly
Thread-Index: AQHbyWvwqpAyb++mGUWmbkArB67j3bP2WZQA
Date: Fri, 6 Jun 2025 15:18:11 +0000
Message-ID: <ed79ddf30322194c0fdae914e9e07862d85f830e.camel@siemens.com>
References: <20250520094514.2672646-1-ejo@pengutronix.de>
In-Reply-To: <20250520094514.2672646-1-ejo@pengutronix.de>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DU4PR10MB8974:EE_
x-ms-office365-filtering-correlation-id: 33aa7ade-f883-444b-6a57-08dda50d59db
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dCtaR1RxcHJVMHYrdUZGa1djMDNKUk1adDF5R3FOY1I3VCtDd3EwcXIwekNZ?=
 =?utf-8?B?SlBKMml6UWh5b0RHb1lnM1FqeW5xQnVqTXlUaVp4RE1vOElWMGxaYVdCVzZ2?=
 =?utf-8?B?SURiRVFZRTdwOFMwYmtQS29Lbnh3NytKczk3SnFmN1paZU5Lb3ZIWnhjSVc5?=
 =?utf-8?B?TXBHT3NUYUNXQUNYSWM0OE5rOXdiMDNoNmJGY1RaWGpGMll0QTNJVnlGSzdv?=
 =?utf-8?B?L1ppUFZlQkpBZHFLTm9keVltUlp2U1ZaRVhoaG5hYU56SXE5K2thNWpjWU9u?=
 =?utf-8?B?c1F0YnpmakRaVit2RVpPNVordG5nWWo3eFd4dmpSWkZ5eExpU3QvZ0NwdGhX?=
 =?utf-8?B?RDVkUDVXeWwyQWxRVDVtVkZoNjkwbTB1TGtwTFlYTWh6U1U2RjBwR0tXcE1t?=
 =?utf-8?B?TklqMU8rNUVPUnhXNGVOKzczTnM5TXdBVHZOdzUvTUZYVFJKWjN2bjltMkJx?=
 =?utf-8?B?cG91VUZRN3ErVHJQRHdPZ3phMlNIUmpueW50VTV4azdPd3B5YkxYdHdzWHlW?=
 =?utf-8?B?M1pkZVQ1Q2hOaDRKQk02ZHZnR3lmSDc4VTA1TE90d2dXeFhuSUgrbERTbm5y?=
 =?utf-8?B?Ym9IaXlMd0xVUnZXN0pQbDQvVDhWb3RQaDVqWjdFSnJXZnNUWnFJa1ZVYkd2?=
 =?utf-8?B?Y0lGUW5tMnFWL0hoYmtzWEw4RjlsUjhvTnRxaVVXcUVUVFZLc29sa2Uxai9M?=
 =?utf-8?B?OW5BWEpoR3d2cVRBSnRwTWtPN3JSZ2kzbXhtK2llbmVURWdSVlBkU29ta1Qv?=
 =?utf-8?B?d0RKTmpQVjkzczR4ZGRHWGNHSzZLemd0VHUrRXphZTkyM0FpcDZWWlVqUDNT?=
 =?utf-8?B?dWVLMUxwQ2c1OGJGL0tCRkFWTkk1a3gydEh3QW9HMUI2bkxhSjZHeVRXM2lT?=
 =?utf-8?B?ZSszMlkrTkxpUDFGb2J4KzM3MUNZeXFnVmk2TDZNVDJlNEltTUUzdXMwbXNF?=
 =?utf-8?B?eW1SNFpDd1ZtYmZqdklueXJBOE1VcWQ2cUhIdDlMV1pacGM0aGpPWTNINUhp?=
 =?utf-8?B?TGdBZFNJUkNIYjhxWUpmTWUzbGx6M1ozZ2hudmpCVkZLWWxiSmpxNUVGY1I1?=
 =?utf-8?B?N2ZOTXZQR3RYUEFtT3Y2RU1GVW0yYmdmQ21EVDlvcVBzMlQ3ejBEL1Ntb2dj?=
 =?utf-8?B?U3pGWlFvdks1RVo3bDFsdEhrbW9rdFNJTlRzYnc3ZWpHL0JoZGZUNGhWd0Vs?=
 =?utf-8?B?N0pNWVJRd0FScmpuV3pUM2RTUkJpLzFUSXJtU3BpMzk5emxPVHU4RG10NVJi?=
 =?utf-8?B?MGJ1VlhVbUJpRVM2dmZqVEMwc1RKcGQxWnJqMW1UQ2Q2OWVBbXR4bXJGM0Ro?=
 =?utf-8?B?Q3Y5bE1maE05bVFKSzN2OU4yWUE5Ri92MVFGa1poVjRlQVBNVEVCZ1BYUERl?=
 =?utf-8?B?eGorbDNqQ1U5OU1aL2cwWWtnVlljWC9aOTZHSG5ZM1BNUG9WdEgwVDVEdy9S?=
 =?utf-8?B?VHR0ODA3bUwrMVIxU3BzeFhTODVSMit1WW5lNW1TYThKQ0VUNmYyelkzcnZs?=
 =?utf-8?B?TTB6TzB2c3gzdnFVSVc5MlZZbTdxcFRnOU82K21GQ0VNekp0NDBVOGlya29z?=
 =?utf-8?B?ZG9wRjlmWlBsRzFPbE9vckNZSjZzT2hiaThhbEQzU1lQSDRjOE1pd0MyM2Fh?=
 =?utf-8?B?SU5WQTdSZERIcit1VllOZ0ZVZ1l1ai91RDZDMWM4RWllWFQ2M1FHTWN6dUtS?=
 =?utf-8?B?dm1Bemh5WlVGUnRCQ055andESG4rY0didjFJVUNWNGt4WjRobGhJU2F4aTBC?=
 =?utf-8?B?UzFtTWNzWHRaQi9qWi9UaHozMXRtYlUvdnUrbyswcG13N01halptV2lpaXU5?=
 =?utf-8?B?bmQvV2tQcG9zTm9Qa0tWRWwzODRrU0k1TDhuQmpGRjg4TW81VTEwcHI3SmZm?=
 =?utf-8?B?TEd0TUVFS3dPRFV5TEFRUHk4eTJRSExPMTVkZ3BtZzlidTdrZ2FDNlIzanRM?=
 =?utf-8?Q?KnTieymd+X0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0FxNXd0QitGaEtycTJyRHZZK2lUMFM1Mm9LYnFYR1p0aGxlRENwNmtsWnhn?=
 =?utf-8?B?dExaSGhmNUZMRkg0Q05zVlZqNFB0Vng0cmF1NFliR1NjTHBaUnFnczJxWXUz?=
 =?utf-8?B?K3VLWnlsc1J4ZU9VV2hmU0tHaGFEV1ZySEZPejMra2VCN2lvMng3ZkppMlpj?=
 =?utf-8?B?ZjRVdGwrYTZPeDVsNC9tc3BPcXc4c0VGSVB2ZE1sbVdQMG1PK1BMbGJubWR5?=
 =?utf-8?B?RjByS0lHM1Z1TzhMWHZkRVVpSjIrMjEvb2ZiOGRyM1NSejhYNzEyYi9mL1Rl?=
 =?utf-8?B?a3dhdGdQeDZhcjdKK3ZPaHNKTnlGSEhjbml1bTMxQ0Uyc0VTMjR6NFVaa2o5?=
 =?utf-8?B?SkQ3OXo3cnV5ZzZtV29lUVFEcVFSNnhPMTNyZTJ0V1RWUi94QWlHTzBTRTI5?=
 =?utf-8?B?aVB0MkNLNWlHNmQ5TFhsZXBOMkxJZzRiRS82SHVSOEZNOG8wM3FCcjhIQVla?=
 =?utf-8?B?WGRuZ1UrdkxLUU9IRDd6TkFBSXpsUEw4Z0JwTER4eENhVWgvZUNQRUJhNVpR?=
 =?utf-8?B?bi8wdXFXeE9UMFFjQ1c0WWljMlpvc3FRcGs4aXFJV0Q5c1BYV1A3L3RtanBi?=
 =?utf-8?B?TUhqSmpTcmdLNGVmMDNBVERFWVFnY3lFdllpam10dVdoWkFSNlJ6ZnhCT0FX?=
 =?utf-8?B?SGxsN2FMYVpoeC9vd2tlajdvaEpoT3pOQW5xbjNsVjhCMlR4UGw1NmRNYVRP?=
 =?utf-8?B?UmVmQmF3eVNTZlRQeUlsb1VPTnV1N1Nwd0ZHUmJRVVh1ZnlCUndXYTA5Q0oz?=
 =?utf-8?B?WmtCUEgrWXFIN0hRZmZ4S25nWHJtd3JnVFpxZ0FSTC92M3pSYmxBQlhONXBa?=
 =?utf-8?B?QkEyektIcjN0ZkJaYTFyb1VvSzNKT3hEN3FhTG9DbGpYME1zTWt0c3JramRJ?=
 =?utf-8?B?MFkxVnQwMU9LbkpkWUJzL3JueVllT09hS0E2N2w2SzI3Nm9YNENHeFN3S3kr?=
 =?utf-8?B?R3BFQTZCNVFCTmlGR3hZejlTT05nZUd6eXdPS3FScEEwMEt6dngrQmxyVDg4?=
 =?utf-8?B?dXdaL3ZnWURhcC9YL3puVXNxU0JZZ1FubG5FM1VHM1JFNlgwS3A2Si9VRXRp?=
 =?utf-8?B?YnlBZGVCNTlCanJlYktkNzF6RjViV0E0VUh4TEpGZWUvL3UzaHgyQWwvVUpH?=
 =?utf-8?B?eDlpTmRSd25zd1VxUmxvL2tERGRBTUZJTElsTnlleDM5NGNiTEh1YUNiYWRu?=
 =?utf-8?B?b3BEWlRMR3lzaitHZkxuZm1CV1huQzVxWlYycHFCQ25HR1pxLzIrZmZ6U3hr?=
 =?utf-8?B?OVppOXc2cWl0WHJXYTRuREJ2Q2xpNFlzRTZlTWZaZVpHanEvSWVBbEJVeFdD?=
 =?utf-8?B?enpPWVhIcVhTYkxRL3ZzUGt2dlM4Wm9yS09UY1VTZEVNMUdSSW5iVnNBMWkz?=
 =?utf-8?B?MFJ2dVBSUUV3ZDBXSGZITFZ2UE9OTXlQYUNabHAxYzRPZElHQkZjU1d1OTJD?=
 =?utf-8?B?d25MMFFYVmF3V2pENzZQUHduck5KLzRhWDhyUWtIOVR5a09WeEFWNUk4eDA2?=
 =?utf-8?B?dDZmY09mL1ltcWVPK0loR1dmRWpoL1A0NDdlS1Zycy9nZEhsMHp6MExPU1Iv?=
 =?utf-8?B?L2dGWEh6RVhLV0NRbmFncHptdjVsVzRSVUVqR0xaOUFSWmlPNHVqdW5hc3Ew?=
 =?utf-8?B?b1FvcnZSY0lYVUkrTUx5Tzh1bXRyOVJycHM4QnBUWkZaSXhWVXU3aDZvRitU?=
 =?utf-8?B?NU5GWTZiTmxzRjNPRzNzRXE3VXZKVTlWSC9ybThadDd1OThTK05FNXJ2ckF0?=
 =?utf-8?B?K2V5SStjWkkzVjdUN2ZVNWRXL0MyVDZIcTY4S1Z2dlA4dUdiRmx5QlhvbTA4?=
 =?utf-8?B?Q0VaTGpxdGVqbE1pMDdRN1pwL2lVTHpid25GRTdSQWFFMHFoTnFZTGdVRlQ4?=
 =?utf-8?B?dHBHWXM4VEZQMWgyUk8xakdibDNtM21MdjdJZy85VGdwU0xHOUJqRS8ySkI1?=
 =?utf-8?B?Qm9ETHRKRWpOTXZDNnRmZHozbHYrNTR1ZWVUc1N6QjBaWVFoZlg1cng5Kzly?=
 =?utf-8?B?aElVamQ3UWI2bEs0SEZIeC9rZ1JRT2J1aGJmTXk4ZU1sVUhnWlVGV3B3N2Nm?=
 =?utf-8?B?K1NSalpwM09PeUx2bXpQWGh5a0lGRkZaU3kxbW9Yd1Njb0xmYTFqampJb1Rn?=
 =?utf-8?B?VXJVb2t5V1M3WWU4dDJseVZZYThyNGsxeGdlbml2ZzM5M2c2SzNXWmRoMW5N?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <573A596885960E419B3C5A7160C5B54F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33aa7ade-f883-444b-6a57-08dda50d59db
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 15:18:11.6767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3aWVyaU09ByCYAhvALkbam/hYwhGyo/WKTrDfPqeb/9AH1qUd++DeroJyIw7pJ9Sdt3hzCa00L5TJCqwy4JtFLUmW5LiNw3dpIO1N/1UqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8974
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 15:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7025

T24gVHVlLCAyMDI1LTA1LTIwIGF0IDExOjQ1ICswMjAwLCBFbnJpY28gSsO2cm5zIHZpYQpsaXN0
cy55b2N0b3Byb2plY3Qub3JnIHdyb3RlOgo+IFRoaXMgbW9kaWZpZXMgdGhlIGRlZmF1bHQgaW5k
ZXhlciBzcGxpdCgpIGFuZCBqcyBzcGxpdFF1ZXJ5KCkKPiBtZXRob2RzIHRvIHN1cHBvcnQgc2Vh
cmNoaW5nIGZvciB3b3JkcyB3aXRoIGh5cGhlbnMuCj4gCj4gV2hpbGUgdGhpcyBtaWdodCBub3Qg
YmUgYW4gaWRlYWwsIHJvY2sgc29saWQsIGFuZCBmdWxseSBmdXR1cmUtcHJvb2YKPiBzb2x1dGlv
biwgaXQgYWxsb3dzIGF0IGxlYXN0IHRvIHNlYXJjaCBmb3Igc3RyaW5ncyBpbmxjdWRpbmcgaHlw
aGVucywKPiBzdWNoIGFzICdiaXRiYWtlLWxheWVycycsICdzZW5kLWVycm9yLXJlcG9ydCcsIG9y
ICdvZS1jb3JlJy4KPiAKPiBCZWxvdyBpcyBhIGJpdCBtb3JlIGRldGFpbGVkIGV4cGxhbmF0aW9u
IG9mIHRoZSB0d28gbW9kaWZpY2F0aW9ucwo+IGRvbmU6Cj4gCj4gMSkgVGhlIGRlZmF1bHQgc3Bs
aXQgcmVnZXggaW4gdGhlIHNwaGlueC1kb2MgU2VhcmNoTGFuZ3VhZ2UgYmFzZQo+IGNsYXNzCj4g
wqDCoCBpczoKPiAKPiDCoMKgIHwgX3dvcmRfcmUgPSByZS5jb21waWxlKHInXHcrJykKPiAKPiDC
oMKgIHdoaWNoIHdlIHNpbXBseSBleHRlbmQgdG8gaW5jbHVkZSBoeXBoZW5zICctJy4KPiAKPiDC
oMKgIFRoaXMgd2lsbCByZXN1bHQgaW4gYSBzZWFyY2hpbmRleC5qcyB0aGF0IGNvbnRhaW5zIHdv
cmRzIHdpdGgKPiBoeXBoZW5zLAo+IMKgwqAgdG9vLgo+IAo+IDIpIFRoZSAnc2VhcmNodG9vbC5q
cycgY29kZSBub3RlcyBmb3IgaXRzIHNwbGl0UXVlcnkoKQo+IGltcGxlbWVudGF0aW9uOgo+IAo+
IMKgwqAgfCAvKioKPiDCoMKgIHzCoCAqIERlZmF1bHQgc3BsaXRRdWVyeSBmdW5jdGlvbi4gQ2Fu
IGJlIG92ZXJyaWRkZW4gaW4KPiBgYHNwaGlueC5zZWFyY2hgYCB3aXRoIGEKPiDCoMKgIHzCoCAq
IGN1c3RvbSBmdW5jdGlvbiBwZXIgbGFuZ3VhZ2UuCj4gwqDCoCB8wqAgKgo+IMKgwqAgfMKgICog
VGhlIHJlZ3VsYXIgZXhwcmVzc2lvbiB3b3JrcyBieSBzcGxpdHRpbmcgdGhlIHN0cmluZyBvbgo+
IGNvbnNlY3V0aXZlIGNoYXJhY3RlcnMKPiDCoMKgIHzCoCAqIHRoYXQgYXJlIG5vdCBVbmljb2Rl
IGxldHRlcnMsIG51bWJlcnMsIHVuZGVyc2NvcmVzLCBvciBlbW9qaQo+IGNoYXJhY3RlcnMuCj4g
wqDCoCB8wqAgKiBUaGlzIGlzIHRoZSBzYW1lIGFzIGBgXFcrYGAgaW4gUHl0aG9uLCBwcmVzZXJ2
aW5nIHRoZQo+IHN1cnJvZ2F0ZSBwYWlyIGFyZWEuCj4gwqDCoCB8wqAgKi8KPiDCoMKgIHwgaWYg
KHR5cGVvZiBzcGxpdFF1ZXJ5ID09PSAidW5kZWZpbmVkIikgewo+IMKgwqAgfMKgwqAgdmFyIHNw
bGl0UXVlcnkgPSAocXVlcnkpID0+IHF1ZXJ5Cj4gwqDCoCB8wqDCoMKgwqDCoMKgCj4gLnNwbGl0
KC9bXlxwe0xldHRlcn1ccHtOdW1iZXJ9X1xwe0Vtb2ppX1ByZXNlbnRhdGlvbn1dKy9ndSkKPiDC
oMKgIHzCoMKgwqDCoMKgwqAgLmZpbHRlcih0ZXJtID0+IHRlcm0pwqAgLy8gcmVtb3ZlIHJlbWFp
bmluZyBlbXB0eSBzdHJpbmdzCj4gwqDCoCB8IH0KPiAKPiDCoMKgIFRoZSBob29rIGZvciB0aGlz
IGlzIGRvY3VtZW50ZWQgaW4gdGhlIHNwaGlueC1kb2NzCj4gJ1NlYXJjaExhbmd1YWdlJwo+IMKg
wqAgYmFzZSBjbGFzcy4KPiAKPiDCoMKgIHzCoMKgwqAgLi4gYXR0cmlidXRlOjoganNfc3BsaXR0
ZXJfY29kZQo+IMKgwqAgfAo+IMKgwqAgfMKgwqDCoMKgwqDCoCBSZXR1cm4gc3BsaXR0ZXIgZnVu
Y3Rpb24gb2YgSmF2YVNjcmlwdCB2ZXJzaW9uLsKgIFRoZQo+IGZ1bmN0aW9uIHNob3VsZCBiZQo+
IMKgwqAgfMKgwqDCoMKgwqDCoCBuYW1lZCBhcyBgYHNwbGl0UXVlcnlgYC7CoCBBbmQgaXQgc2hv
dWxkIHRha2UgYSBzdHJpbmcgYW5kCj4gcmV0dXJuIGxpc3Qgb2YKPiDCoMKgIHzCoMKgwqDCoMKg
wqAgc3RyaW5ncy4KPiDCoMKgIHwKPiDCoMKgIHzCoMKgwqDCoMKgwqAgLi4gdmVyc2lvbmFkZGVk
OjogMy4wCj4gCj4gwqDCoCBXZSB1c2UgdGhpcyB0byBkZWZpbmUgYSBzaW1wbGlmaWVkIHNwbGl0
UXVlcnkoKSBmdW5jdGlvbiB3aXRoIGEKPiBzcGxpdAo+IMKgwqAgYXJndW1lbnQgdGhhdCBzcGxp
dHMgb24gZW1wdHkgc3BhY2VzIG9ubHkuCj4gCj4gV2UgZXh0ZW5kIFNlYXJjaEVuZ2xpc2ggKHdo
aWNoIGV4dGVuZHMgU2VhcmNoTGFuZ3VhZ2UpIGhlcmUgdG8gcmV0YWluCj4gdGhlIHN0ZW1tZXIg
Y29kZSBhbmQgc3RvcHdvcmRzIGZvciBFbmdsaXNoLgo+IAo+IFtZT0NUTyAjMTQ1MzRdCj4gCj4g
U2lnbmVkLW9mZi1ieTogRW5yaWNvIErDtnJucyA8ZWpvQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+
IAo+IENoYW5nZXMgdjEgLT4gdjIKPiAKPiAqIGV4dGVuZCBTZWFyY2hFbmdsaXNoIGluc3RlYWQg
b2YgU2VhcmNoTGFuZ3VhZ2UgdG8gcmV0YWluIHN0ZW1tZXIKPiBjb2RlCj4gwqAgYW5kIHN0b3B3
b3JkIGhhbmRpbmcgKHJlbmFtZSBjbGFzcyBhY2NvcmRpbmdseSkKPiAqIGRyb3AgImxhbmcgPSAn
ZW4nIgo+ICogRXNjYXBlICctJyBpbiBfd29yZF9yZSB0byBwcmV2ZW50IGZ1dHVyZSBtaXNpbnRl
cnByZXRhdGlvbiBhcyByYW5nZQo+IMKgIHN5bWJvbAo+ICogZHJvcCB1c2VsZXNzIHNwbGl0KCkg
bWV0aG9kIG92ZXJyaWRlCj4gKiBVc2UgZXh0ZW5kZWQgb3JpZ2luYWwgcmVnZXggZm9yIHNwbGl0
UXVlcnkoKSBpbnN0ZWFkIG9mIHVzaW5nIGEKPiBjdXN0b20KPiDCoCBvbmUKPiAKPiDCoGRvY3Vt
ZW50YXRpb24vY29uZi5weSB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24vY29u
Zi5weSBiL2RvY3VtZW50YXRpb24vY29uZi5weQo+IGluZGV4IDJhY2VlYjhlNy4uYWQ2MGQ5MTEz
IDEwMDY0NAo+IC0tLSBhL2RvY3VtZW50YXRpb24vY29uZi5weQo+ICsrKyBiL2RvY3VtZW50YXRp
b24vY29uZi5weQo+IEBAIC0xMyw2ICsxMyw3IEBACj4gwqAjIGRvY3VtZW50YXRpb24gcm9vdCwg
dXNlIG9zLnBhdGguYWJzcGF0aCB0byBtYWtlIGl0IGFic29sdXRlLCBsaWtlCj4gc2hvd24gaGVy
ZS4KPiDCoCMKPiDCoGltcG9ydCBvcwo+ICtpbXBvcnQgcmUKPiDCoGltcG9ydCBzeXMKPiDCoGlt
cG9ydCBkYXRldGltZQo+IMKgdHJ5Ogo+IEBAIC0xNzMsNiArMTc0LDI0IEBAIGxhdGV4X2VsZW1l
bnRzID0gewo+IMKgwqDCoMKgICdwcmVhbWJsZSc6Cj4gJ1xcdXNlcGFja2FnZVtVVEY4XXtjdGV4
fVxuXFxzZXRjb3VudGVye3RvY2RlcHRofXsyfScsCj4gwqB9Cj4gwqAKPiArCj4gK2Zyb20gc3Bo
aW54LnNlYXJjaCBpbXBvcnQgU2VhcmNoRW5nbGlzaAo+ICtmcm9tIHNwaGlueC5zZWFyY2ggaW1w
b3J0IGxhbmd1YWdlcwo+ICtjbGFzcyBEYXNoRnJpZW5kbHlTZWFyY2hFbmdsaXNoKFNlYXJjaEVu
Z2xpc2gpOgo+ICsKPiArwqDCoMKgICMgQWNjZXB0IHdvcmRzIHRoYXQgY2FuIGluY2x1ZGUgaHlw
aGVucwo+ICvCoMKgwqAgX3dvcmRfcmUgPSByZS5jb21waWxlKHInW1x3XC1dKycpCj4gKwo+ICvC
oMKgwqAganNfc3BsaXR0ZXJfY29kZSA9ICIiIgo+ICtmdW5jdGlvbiBzcGxpdFF1ZXJ5KHF1ZXJ5
KSB7Cj4gK8KgwqDCoCByZXR1cm4gcXVlcnkKPiArwqDCoMKgwqDCoMKgwqAgLnNwbGl0KC9bXlxw
e0xldHRlcn1ccHtOdW1iZXJ9X1xwe0Vtb2ppX1ByZXNlbnRhdGlvbn0tXSsvZ3UpCj4gK8KgwqDC
oMKgwqDCoMKgIC5maWx0ZXIodGVybSA9PiB0ZXJtLmxlbmd0aCA+IDApOwo+ICt9Cj4gKyIiIgoK
V2l0aCB0aGlzIHBhdGNoIEkgZ2V0IHRoaXMgd2FybmluZzoKClJ1bm5pbmcgU3BoaW54IHY3LjMu
NwouLi5wb2t5L2RvY3VtZW50YXRpb24vY29uZi5weToxODg6IFN5bnRheFdhcm5pbmc6IGludmFs
aWQgZXNjYXBlCnNlcXVlbmNlICdccCcKICAuc3BsaXQoL1teXHB7TGV0dGVyfVxwe051bWJlcn1f
XHB7RW1vamlfUHJlc2VudGF0aW9ufS1dKy9ndSkKClNob3VsZCB0aGF0IGJlIGEgcmF3IHN0cmlu
Zz8gTGlrZSB0aGlzOgorICAgIGpzX3NwbGl0dGVyX2NvZGUgPSByIiIiCgpSZWdhcmRzLApBZHJp
YW4KCgoKPiArCj4gK2xhbmd1YWdlc1snZW4nXSA9IERhc2hGcmllbmRseVNlYXJjaEVuZ2xpc2gK
PiArCj4gwqAjIE1ha2UgdGhlIEVQVUIgYnVpbGRlciBwcmVmZXIgUE5HIHRvIFNWRyBiZWNhdXNl
IG9mIGlzc3Vlcwo+IHJlbmRlcmluZyBJbmtzY2FwZSBTVkcKPiDCoGZyb20gc3BoaW54LmJ1aWxk
ZXJzLmVwdWIzIGltcG9ydCBFcHViM0J1aWxkZXIKPiDCoEVwdWIzQnVpbGRlci5zdXBwb3J0ZWRf
aW1hZ2VfdHlwZXMgPSBbJ2ltYWdlL3BuZycsICdpbWFnZS9naWYnLAo+ICdpbWFnZS9qcGVnJ10K
PiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVz
c2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5lICgjNjg0Nyk6Cj4g
aHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvZG9jcy9tZXNzYWdlLzY4NDcKPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMTMyMDgxNTUv
MzYxNjg1OAo+IEdyb3VwIE93bmVyOiBkb2NzK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcK
PiBVbnN1YnNjcmliZToKPiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9kb2NzL3Vu
c3ViwqBbYWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbQo+IF0KPiAtPS09LT0tPS09LT0tPS09
LT0tPS09LQo+IAoK

