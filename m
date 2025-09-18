Return-Path: <barne.carstensen@danfoss.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF44CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 06:48:09 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.26])
 by mx.groups.io with SMTP id smtpd.web11.7818.1758178081098296113
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 23:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@danfoss.com header.s=selector1 header.b=PiClYQeg;
 spf=pass (domain: danfoss.com, ip: 40.107.159.26, mailfrom: barne.carstensen@danfoss.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwVbY8eELoy4s1lcEX/jb/gpjWK/9n+KqrHjkfz7zMTZYxi42cM7yTZSgqv65qJcatCJ4byVFH4nveGlfVx2g3vtYbpWcuJLqU1zzZpNxjT+sWkc1BrUx9CG43qyiixbyDbfogfeDo2kzxQCd/FLrEj9QwPUkrtgt2pvBOrX+fEgLNWLq/kHLO03kb1QYXOpXbAfnuis/Q0UfobHq0HeC2M4ZNabyCmALK6ng9lV9Ya+39SPtALktcH1YAivcSuzmO/NWd6vs8eZTVwCjIqExCy1PM5MeoQ1Q6BQsr65T5IT03nieXNhyP/4QyQ4TSTGv5Il+Ylm5kFrsZYxbxaOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk2UOiO5e4aD+JrKBAJmRTABdzaeR72964fgm4os5xE=;
 b=Slp5GMvsrbs6bDLKdzXVpNix14L2Yv8paySGs9BX/T6qZs91fwk3lnSKme5RV0NYoPm/qMaV4VkrLMIGALzCy2iJVuJieiQgHlV5PtYvhxpISAEtMtWSW3DC7vE5Bo2O+I2HUyTQb1ooNcZUpeOGxKG95WO0fUDbqWrTGm9nWjWAxugU8H1CgkNGxA9YqS5q7GJLCJ2v2udHwWHNLfsebznkCzWbL8SM4bQfPd21dkotZSjW2JLQIyW52cAVHfvOL1v+DngKaNhBCsNp5CxM/8MPIhG3zeFEV0R/KddPN4QjvjKk5GXM9aCMKRuMKzrIySWUHZloW6Qg69tSsA3I0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danfoss.com; dmarc=pass action=none header.from=danfoss.com;
 dkim=pass header.d=danfoss.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danfoss.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk2UOiO5e4aD+JrKBAJmRTABdzaeR72964fgm4os5xE=;
 b=PiClYQegmst3E9O/TNGIZgpXKP3m8EGY51O7JYX+f7HMcsZsK78BCsWCLSe5LQkHrILGAC1kFgf926d6WNQdOSuXUsJB1l4vXTnQ1mwcPynZcb4WddDxQIapIIFiWnFgj1D59zdvkYtou2zTlMmr8HlKL9AyfyxhSERidg2NIBJc1vzpoGHwOuvIGBR+N5wdt0qAgHiRX/+WjARkU/MhCrXMtB8R5vyYjW59LCd2V9teS+sXaY9GU+OztNrqvkpST/isrIRmz+y/LDDV0T1tF3AO/ZPe0dY+rjSE9p1HsdceL0CgxcNQJoQTFs6QtbqkZDqQAbm2GYqvzW38xGDsUA==
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:216::23) by PR3PR01MB6315.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:39::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 06:47:55 +0000
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a]) by DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:47:55 +0000
From: Barne Carstensen <barne.carstensen@danfoss.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] test-manual: update runtime-testing Exporting
 Tests section
Thread-Topic: [docs] [PATCH] test-manual: update runtime-testing Exporting
 Tests section
Thread-Index: AQHcJvk/dC7CKQEHYUiCF/es55EaL7SXac8AgAETOFA=
Date: Thu, 18 Sep 2025 06:47:55 +0000
Message-ID: 
 <DB9PR01MB721021EA63D8B3D9505A65278716A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
References: <20250916110116.1227-1-barne.carstensen@danfoss.com>
 <DCV4R6GV3UVN.IJQ57DG44IXK@bootlin.com>
In-Reply-To: <DCV4R6GV3UVN.IJQ57DG44IXK@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Enabled=True;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SiteId=097464b8-069c-453e-9254-c17ec707310d;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SetDate=2025-09-18T06:28:46.0000000Z;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Name=1.
 Business;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_ContentBits=3;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=danfoss.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR01MB7210:EE_|PR3PR01MB6315:EE_
x-ms-office365-filtering-correlation-id: ede00cdd-ffce-43f9-bd17-08ddf67f4c21
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-7?B?ejZjU2lDQkxjZistcUVZR1FpVERUNDgvZE5ldENDQ1pYKy1HM0FDMExwbi9x?=
 =?utf-7?B?TW8zdzdwRmNjQXJmelRlSG9DVCstbnlhTGRxNnZ6cmJzeDVrN24vMHRFYlZa?=
 =?utf-7?B?eDNzb3p5di9SaVhwWHZxL1A5eWNseCstOHloL0NUZ1Q5R3pXOVZ2VG9NZEpn?=
 =?utf-7?B?MGZjQUVRb25DMGtocmo4alF0Yk43Q2NCS1BaOWpwMXlWeUdzbDBSNlJBT0Iw?=
 =?utf-7?B?RzFJcE5Na28rLTBXKy1lUy90MjJocHdzZ20xKy1VdSstSnpxUzFVdG5NSFBZ?=
 =?utf-7?B?Q0dXNnRlcVhadFNscTk1SlBkVjQ1NUkzSEQyNXE5d1F0S21yKy1EamZ2UGRD?=
 =?utf-7?B?TXZLTi9iaGNwbzZmY0tob2VSNk5iQkVPVXNnd20zSzB4QmkwaE5lZGpyRVpi?=
 =?utf-7?B?UlkvcUNFKy16SEJkb1BDOVVKV0JGSUdWelhIbGhmdFRlWFJ4aGV2eWRFWSst?=
 =?utf-7?B?ME56S1c5RnAvNUtkRjJpRFpSd2s2RHZJREIyeTZqTWdiazJqaVQ0V1lDdFM0?=
 =?utf-7?B?TTAwa3hTMjd3YnRKM0lnWTBhWVA3OGFQbGdjS21JTkJwTC9UMzBhWENxdERs?=
 =?utf-7?B?Y0hpZmxaQ3pibXp3WmkwMG5mcXViUHF6bUI1YkhMSU1KMmtqaFV6Zk5ZZEFR?=
 =?utf-7?B?NHk5UC85ZHlrcENJcmFBbUQwdXVMbUFkaE5YcmM5VHpZUG41Q1VjQTRrYkFE?=
 =?utf-7?B?TklhTWlKMjhRR1A1S0RZV1ZDUndUWG1YYzhlN2p3WWptbnpmRU1qcFJVYkN5?=
 =?utf-7?B?OElkNWhjY05JdmhEaURxTHIybVpaQ2RDeFI0UFh2Qk84cDB2eXNUSERlb2lk?=
 =?utf-7?B?ekVqV0g0Y3JNNlpBOVYyQy81ZXBTd0ZWYzdHMmJ2bmxlQzFYT2NpNFFGUWYy?=
 =?utf-7?B?L1BnNWFOVnhPd0Z3eXY5MldCMGFhZXo5eTRVVXdSNzRGUWt5Q3dVakhjUlNF?=
 =?utf-7?B?ZXRTakhnSUp2UlFtUWR5UGtFdlNhNkl4TzUxL21yT1BLY09LY0ZweDdjdE9m?=
 =?utf-7?B?MFJnb2lyRnU2eDNueVM4WU81NkVabTJaSzBBVXF4ZGhkSnZSb0NVSXhLeVFy?=
 =?utf-7?B?b1Zyc2Q0aFp5VkJxeW83WmIxS1JHbVRPZ1BkY2VlbjdqYkN3eVpZNkF5ZEQ4?=
 =?utf-7?B?NmtZb3ZKeHpBSU43MkpNdCstcXNBMXpaQlVaWmZmdlh1Q2tCWTRjRW8rLUlH?=
 =?utf-7?B?aUdzTThjdjNXMFZNWURqTDMzeUtYbUI4ZnM1QXJMYWh6THVaY2crLWxVMk55?=
 =?utf-7?B?RTIrLXJlL0d6eDMvWDQwNEZSTFdxVlNWeXRpKy1JZm0yeUs3bVdHdWx0bEE=?=
 =?utf-7?B?VSstcHZZMnBMUmErLXA0bDVLYVMrLUl1djhTY2krLW5WS0xVM0MxejE3cm1D?=
 =?utf-7?B?REJiOCstOHFhZGlsRzNMaEFSTHpCSFUweTg1SzRSSFlrOEZjVXdEaHJBcndP?=
 =?utf-7?B?M0FlRXg2MmVLdzBhVlFTQWphSkkzQjZzUWZ6Ky1aQlEzYmw1UVkrLU0vMkFu?=
 =?utf-7?B?MnY2UFVyaW1BcjBuQmU1djN5LzJHY0d4ODhUeUhwZFJsOEdqYXRwb3U2TTNo?=
 =?utf-7?B?SVNxL21wcG9idmdIdER3TUw5aTFqbkJjdGZMTkVWQnRGKy16QjdGMTRQTjFq?=
 =?utf-7?B?eFpuVnJtVVdQZFVwQUNNbWlhblBqSG5TUXM3amdGTHplcEdPaEhVVjlnNXBh?=
 =?utf-7?B?MTNBY0NmL0o0QWRac2grLWxjY1plYmcyNkRyOXBaUWNoc1RtZXhnbVhlbCst?=
 =?utf-7?B?b1lqVXR0VnpzWHFBZ21ncjRsQUM1dENoaG1DVnpkZnI0cmNhNG5lWEZNZ0JW?=
 =?utf-7?B?NTd0bXVxdEY0ejNwNkdaV2FKUXR0Ui81SGs0Slk0YWE3OE81Q0dZUTJRSFJX?=
 =?utf-7?B?b211cEljallFeFFkSEFaWUVmRkpjckkrLVV6ZTFZRWl3OFFpZ1pXVWtlaFY2?=
 =?utf-7?B?bUVLa0Y0ZWcrLTE5Ky1hSTdMaXo2cXZPcElJa0xVbUY1Vk4rLUNtdmVz?=
 =?utf-7?B?K0FEMC0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR01MB7210.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?Tlc1M3pyM01XMjVCNmtTUFhuMy9LVWgxcHJQS2M1ZEJ6UUlGeG10YzJqcVI3?=
 =?utf-7?B?cE5Ub1BQUXJ4dzRCWjFNcW43alMxQmFEYVA4TU1GM0t3dnhzSWNJVm90N1lt?=
 =?utf-7?B?dzNYSWpCUUllWG92TjAwcVZvR1JVVkYxaURJN3dWWko4VFcvdHJ3VXNiWElS?=
 =?utf-7?B?UG9uajlBU0lhcm1TS1Y5UThIUUkwbk1OeklmWm5oUTVRdHlGY2tGSTBxcWZQ?=
 =?utf-7?B?c2pIb2VXb00vUkpzbi9zaFFyQ3AwSmY2Tzl4Q1FVU2ZQN3dGUTA4dThRLzdy?=
 =?utf-7?B?bGNHdEYyZ3V4TS81SGVMbWQzV04wTmtrcElvV1hSb2ZGMW83RHQxWWpRM3hy?=
 =?utf-7?B?NEhiTFBkNEdZQWUvVFBWcFc0eVN4ZWEyNFZpKy1RaWVBTnFNY1A0Y3RnR25R?=
 =?utf-7?B?WW55clBJSktuV041cHpMZDdFYWp6UU4vSUtDWWk0c0pKeVZVYystMXRITjZE?=
 =?utf-7?B?NEhvWSstVVRkU3dCSC93d1UvelBEbzhPbktIZ3BpYy9OKy11Nk5leTZIcXJO?=
 =?utf-7?B?MU13WEx2ZVV1U0RkcVBxYVBucm4vSXg3VnZ2QXh5bzNJQmRHTzZwNkcvQ2VR?=
 =?utf-7?B?R1k0eEVSdlRMNCstZHhscE1KQSstbzFrYmpOQmdNejJzTVp6V1gyUFNSYWg=?=
 =?utf-7?B?U04rLWY4SHB0Y2tJUlM1cGNDRkpEUTZQZGVjMVRsc1FCZzdpSkF6NnNmMlFL?=
 =?utf-7?B?OGY5WE1zZUEvNzZoOGZySm4zTktFOHdYejd3dDVtNlNRUmRIRFJoUzh3ZUZs?=
 =?utf-7?B?S0pEYmhwcWlNdG92MW1DT2llZm1YajZIZ0llSmVjZmVtSkVmTG1zY2ozcnZ0?=
 =?utf-7?B?eVV5Yzg3aFNVWHdQSmhCanNsc2QxRC9LbVBjQjVwKy13STBOb0xPWWFXWWhl?=
 =?utf-7?B?ZGJNVzRsdk0vY2V1Zk13VWJlVnluc2dsaFlWMmJ2Smg1YWRTbDVqakVMUFU1?=
 =?utf-7?B?MmRkaGxBVVNLaURiNUFZWWxsUkNSazYwdE8zcnBGWVpuVlI0NzAwZG55UGwv?=
 =?utf-7?B?OXdycWViMlc0SS9CNkEvTDhPNW5hdVBOcGtYUGdCb1c5V1FHNTBqN3RMNzVD?=
 =?utf-7?B?RSsteHJsanFwTystWWNzOFRzRzZNdkRYdVBuSjdyQXFseW5CVTlyZDVwSkhk?=
 =?utf-7?B?QVlidUt3aTFaak9NeUVPQ0FINExPVUJrQTlOcVFoUFRzWTN6VTh5ck42MldF?=
 =?utf-7?B?MXJoKy1xbXM0MTQvcm5BV0ZXR2tISU9QTTBOTU9rNjlmLzMxVEVpR2Y2UHNi?=
 =?utf-7?B?QlpvUGlJQTg3b1pGcnZLdEdGdnllZGtTR0hoSjJRYUVxdEt0Sistd0dPYUti?=
 =?utf-7?B?SGNDRlZ6dTBjSE1NWkR0Rk9tR3VlaVd0a3UrLXlQNFZnZS9Ed3FQaFpMZFhM?=
 =?utf-7?B?RlRSWistY0tIdWFoSHdDNVU1TElOR2l3Q0M0VkZwYnlJWU9IZzVYVEorLUhQ?=
 =?utf-7?B?bU90YnZjUVFCZlNvQ3BjQjFvOFlOcXEva2N2NU9xcVcrLThqOU5mOFN0QWpZ?=
 =?utf-7?B?QU92Ky1GNWREQnNhV3RwY3NBbystdDJOUFBuMjIxZllwR2pXWlV0WWZOdG1M?=
 =?utf-7?B?Vk92Ky1LbkVpNG55Tm85ancyTnNTNXRoVEVEVUF6eE1vUEdiSWhCUDhwN3pC?=
 =?utf-7?B?L3R6TEdaTFhtVVExR2V6bG9WaG5iaXFrRDIvSnlMKy1sSERXNDBod2NTRG93?=
 =?utf-7?B?a1Z3aEFPQXkxeW1qdGgwZEx4aEJ4ZnhSQTk2bGxOVks5cjB4d3d4ZEw2TWI=?=
 =?utf-7?B?Ky1tblNHZjYrLUUvWlRBTE1KdU1SenFnWXF1TUcrLW0wbjY1Z0Iwd1hzZHY=?=
 =?utf-7?B?MmkvKy1hcE93elNvR1lvV3dqbjZVSkVDbHdWYW1CcTI5VnU2L3ZlTEFDblY4?=
 =?utf-7?B?dW13Ni9EenRSeXY3TTF6cVhaMWFMYThEQ0JDUkx3VlBtcFJzSll2Q1BUODRY?=
 =?utf-7?B?a2laNDFtaURYU1I3LzBLbSstVVpqNEc2UnRUWmdaYjdJNU5LZ1UzOHdvczRx?=
 =?utf-7?B?aHp1Z01pQnJWNVE2cGdqdnlBRG9BLzkzeUJQN0F0V3JCc0d5RGpiY3BCQ0ts?=
 =?utf-7?B?aU5SS3dKT3RBR1VZajdTTSstaTlqdnE3bjVMM3pQOVl1M2hXQUJEU2tVa2dN?=
 =?utf-7?B?dUdBT0JJS0ZLcy9Fb25kdjVxTjhUQVhKV045TFVoWVhUOTJCaVhpcFJsYnJ6?=
 =?utf-7?B?OTFFcVZqZlgyenFINWVhVjhYV1Y2dkVMenZ0U0FKUStBRDBBUFEt?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: danfoss.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR01MB7210.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede00cdd-ffce-43f9-bd17-08ddf67f4c21
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 06:47:55.4825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097464b8-069c-453e-9254-c17ec707310d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kvj2svyL/XBjiVNEyyaBtqpqv0yZ/dOTjevQ5Gl7ld/Ad59CeIhGSUMNC6x7asihybkMyMJC7iRAe8yFsY1aUU9+Rj/tjvdEuJZFVghQUmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6315
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 06:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7538

Hello,

Thank you for reviewing and testing. Sure, I will add more information to t=
he commit message next time. With the +ACI-commit that implied this change+=
ACI- you mean the commit in oe-core which switched from runexported.py to o=
e-test? I did not notice the error, btw.

Barne


Classified as Business
-----Original Message-----
From: Antonin Godard +ADw-antonin.godard+AEA-bootlin.com+AD4-
Sent: Mittwoch, 17. September 2025 16:04
To: Barne Carstensen +ADw-barne.carstensen+AEA-danfoss.com+AD4AOw- docs+AEA=
-lists.yoctoproject.org
Subject: Re: +AFs-docs+AF0- +AFs-PATCH+AF0- test-manual: update runtime-tes=
ting Exporting Tests section

+AFs-You don't often get email from antonin.godard+AEA-bootlin.com. Learn w=
hy this is important at https://aka.ms/LearnAboutSenderIdentification +AF0-

Hi,

On Tue Sep 16, 2025 at 1:01 PM CEST, Barne Carstensen via lists.yoctoprojec=
t.org wrote:
+AD4- Signed-off-by: Barne Carstensen +ADw-barne.carstensen+AEA-danfoss.com=
+AD4-
+AD4- ---
+AD4-  documentation/test-manual/runtime-testing.rst +AHw- 19
+AD4- +-+-+-+-+-+-+-+-+-+-+-+--------
+AD4-  1 file changed, 12 insertions(+-), 7 deletions(-)
+AD4-
+AD4- diff --git a/documentation/test-manual/runtime-testing.rst
+AD4- b/documentation/test-manual/runtime-testing.rst
+AD4- index 557e0530b..909448ab2 100644
+AD4- --- a/documentation/test-manual/runtime-testing.rst
+AD4- +-+-+- b/documentation/test-manual/runtime-testing.rst
+AD4- +AEAAQA- -403,7 +-403,7 +AEAAQA- defined in :term:+AGA-TEST+AF8-SUITE=
S+AGA-.
+AD4-  If your image is already built, make sure the following are set in
+AD4- your  +AGAAYA-local.conf+AGAAYA- file::
+AD4-
+AD4- -   INHERIT +-+AD0- +ACI-testexport+ACI-
+AD4- +-   IMAGE+AF8-CLASSES +-+AD0- +ACI-testexport+ACI-
+AD4-     TEST+AF8-TARGET+AF8-IP +AD0- +ACI-IP-address-for-the-test-target+=
ACI-
+AD4-     TEST+AF8-SERVER+AF8-IP +AD0- +ACI-IP-address-for-the-test-server+=
ACI-
+AD4-
+AD4- +AEAAQA- -413,18 +-413,23 +AEAAQA- following BitBake command form::
+AD4-     +ACQ- bitbake image -c testexport
+AD4-
+AD4-  Exporting the tests places them in the :term:+AGA-Build Directory+AG=
A- in
+AD4- -+AGAAYA-tmp/testexport/+AGAAYABc- image, which is controlled by the
+AD4- :term:+AGA-TEST+AF8-EXPORT+AF8-DIR+AGA-
+AD4- +-+AGAAYA-tmp/testimage/+AGAAYABc- image, which is controlled by the
+AD4- +-:term:+AGA-TEST+AF8-EXPORT+AF8-DIR+AGA-
+AD4-  variable.
+AD4-
+AD4-  You can now run the tests outside of the build environment::
+AD4-
+AD4- -   +ACQ- cd tmp/testexport/image
+AD4- -   +ACQ- ./runexported.py testdata.json
+AD4- +-   +ACQ- cd tmp/testimage/image
+AD4- +-   +ACQ- ./oe-test runtime
+AD4- +-
+AD4- +-.. note::
+AD4- +-
+AD4- +-   You might need to run the image under QEMU or deploy it to your
+AD4- +-   hardware before you can run the tests.
+AD4-
+AD4-  Here is a complete example that shows IP addresses and uses the
+AD4- +AGAAYA-core-image-sato+AGAAYA- image::
+AD4-
+AD4- -   INHERIT +-+AD0- +ACI-testexport+ACI-
+AD4- +-   IMAGE+AF8-CLASSES +-+AD0- +ACI-testexport+ACI-
+AD4-     TEST+AF8-TARGET+AF8-IP +AD0- +ACI-192.168.7.2+ACI-
+AD4-     TEST+AF8-SERVER+AF8-IP +AD0- +ACI-192.168.7.1+ACI-
+AD4-
+AD4- +AEAAQA- -435,8 +-440,8 +AEAAQA- Use BitBake to export the tests::
+AD4-  Run the tests outside of
+AD4-  the build environment using the following::
+AD4-
+AD4- -   +ACQ- cd tmp/testexport/core-image-sato
+AD4- -   +ACQ- ./runexported.py testdata.json
+AD4- +-   +ACQ- cd tmp/testimage/core-image-sato
+AD4- +-   +ACQ- ./oe-test runtime
+AD4-
+AD4-  Writing New Tests
+AD4-  +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-

I've tested these changes and it looks like this applies since ed4238487c81
(+ACI-testexport: Fix to work as an image class+ACI-). So can be backported=
 to walnascar and scarthgap.

I will include this in the commit message, as I think the patch itself is c=
orrect. Next time, can you please include a commit message body describing =
the change and ideally referencing the commit that implied this change?

I've tested this on a core-image-minimal/qemuarm64 build and was able to ru=
n some tests with your modifications. So:

Tested-by: Antonin Godard +ADw-antonin.godard+AEA-bootlin.com+AD4-
Reviewed-by: Antonin Godard +ADw-antonin.godard+AEA-bootlin.com+AD4-

I just had issues, I wonder if you also encountered them:

    File +ACI-.../tmp/testimage/core-image-minimal/meta/lib/oeqa/runtime/ca=
ses/storage.py+ACI-, line 129, in setUpClass
      self.test+AF8-dir +AD0- os.path.join(self.mount+AF8-point, +ACI-oeqa+=
ACI-)
                      +AF4AXg-
  NameError: name 'os' is not defined

I have the feeling that this works when using +AGA-bitbake -c testimage +AD=
w-image+AD4AYA- directly, because in bitbake the os module is available by =
default, and OE-Core test were written with this in mind?

But in an exported environment, you obviously don't have this module import=
ed by default, like any other Python program (even after having sourced the=
 environment). In that case this would maybe mean that:

- we should import os in these files.
- or we consider that these tests were made for OECore testing with testima=
ge
  only.

Thanks+ACE-
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/


