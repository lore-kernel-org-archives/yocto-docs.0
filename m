Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD66C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 12:10:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.81])
 by mx.groups.io with SMTP id smtpd.web11.49709.1739794239689006598
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 04:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NXuaFgU9;
 spf=pass (domain: cherry.de, ip: 40.107.249.81, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOu4dcNEF8pFe88VRR2mhyGrX0Hk2WZF2lF7aVEvbd+A6ZefnjBxbI5kG6d2zlre2Jmw0/uW4gKm4YY0GiP+ToicAzpfoJV/kVNn9ayWpyhF/0597hwem8sCXdEE20Hl8c9T7ThBGcorD1216LlGE5x2ZWTp4Et8OjXwAkpZYq5ZdA9e4+pBlRK73Pq0Nr/UtFYhHPlOA67OWSdb8Pbz3Vxyglo+wtIBy8dFH9dF6+qibOvhKC0fuxxOTiyBfD2AtOrkL2jGinFyju3nnSMRgHjqbQnGdVURWYOf1i8zxhULksnCShkSIhR41jMJOunVoJfcuEwPJlVHNHGt9b0nwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddQtMfLyHol+iLiZcKdtNKpOR2HOdJZGIoj/tD9A9jg=;
 b=dhcazmNDA8X7PiKSCrjXc4LbpnxdEPmHJtaMyRWN8Hafv25HmETHTcbttTu60yr1XLZzi6nPikZa06bhvuSmw9XbioRoKHWrDpqS1pyM13v1WifRia5vcKpSD7s/BW53gx/nh/oimEeuu4ImEUPfamyz0ux6kp/JgDpLPNeJfaqrKUAglKjcXY8kNWRNiB3XZ8K6rg+PlSxGmUp1KYCNG7rWu5d/psaJzz/9ps+yPm0bIqqhp9KFYpzJWHQYkHq5IQq1Wkv6nDjl/+lFXYeL9E+5FCQ4nqEiZCdc4IV/L0F/zzXEFUy4+Y4LY7C3F+vKo9b54vuSJZo+iHA35Bu+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddQtMfLyHol+iLiZcKdtNKpOR2HOdJZGIoj/tD9A9jg=;
 b=NXuaFgU9Kf9U1QbTtJqmmMwkLY7BeSsBo5dAxEu0Jry7Dpn/qIaMhKFaMsLxOPn0bFoVoKnJeIWqZ0+WRJC1os4bti7YK3p5y6+skap+pWRTLDg53YkcdueSps94E4wmS0Enn/vVt66lNuGdGmPnfVxO9WAPp8oV0OMhp4rY6KQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAWPR04MB10007.eurprd04.prod.outlook.com (2603:10a6:102:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 12:10:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 12:10:36 +0000
Message-ID: <5e9e10ea-393e-42f9-a4fe-38509f16366d@cherry.de>
Date: Mon, 17 Feb 2025 13:10:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/6] dev-manual: move multiconfig documentation
 to its own document
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
 <20250213-multiconfig-doc-v2-1-f2bd35115cb7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250213-multiconfig-doc-v2-1-f2bd35115cb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAWPR04MB10007:EE_
X-MS-Office365-Filtering-Correlation-Id: 82239b08-703e-458e-5404-08dd4f4c1614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a2VQenpRaVk3bFpIanozMzlXZ09sRzB2YXM3aXV2TFhWSnN0VlY1QWhDejNo?=
 =?utf-8?B?L2V2TklKL3NUaTk0cDNsKzIwY3VTWkIyRmx1b1BIMTdTSEdQcTMwaTIrVGg0?=
 =?utf-8?B?bnBHR3drTFJ1My90M0F5R3dCYjJ1d0pDNnE4R3dpU1dkVHU1YnM4YXI4NHVz?=
 =?utf-8?B?bnd0dnhVaHR4YU11MXRRSEkvY1BKd3crcWlDU290eDQ2TExiandvdTFTbEkw?=
 =?utf-8?B?djl1VDlNS2hjL1pOLzZVV3R5ZzY3eklVYytDOUlYZ2hFNWdYWlVPdmV3T0R0?=
 =?utf-8?B?QU1sQ2phZFltSnpmbkkrUjdpb0JJaEd3ck1sRXNlbkxmNGo1QlE1N2VKREtr?=
 =?utf-8?B?dEh0bkM2a0NzU0hvT0JSM0EvbkMvODUrZDVZZ3lDSEtzbnN5STFWViszZGFC?=
 =?utf-8?B?L2gyWWlHNVBLaitQYWdwdkhhYjN2NWpMRGpORnpFS0IzNWtiRURwcWhSU1o3?=
 =?utf-8?B?U0lYZlpTU0ZLVVNUZjFTQ25xQ2VNakZURVZsaXBYdG96a3lpREpUQWRWbjNm?=
 =?utf-8?B?SG85enNlTjkvdGxEVjZYNm9keDh2ZnJUZnV6ODI0Q0RrS0djS0V2bTVnU3lm?=
 =?utf-8?B?STBoTE14QUVxNDhxQVFyWm1TdThRcnFNSGNFM1pnRHlleTZIQUN3ZXUxdDdQ?=
 =?utf-8?B?Z0FCRFg2a0k2ckR0RDFaV2t6ckpjSW96Mk4zR3FSdjFMenNPWjMyWGhlWlRU?=
 =?utf-8?B?NVNiR0hjUEFNZ2Nua0lMcFc4T0x1NjhyTGcrOHpLaXpxRjJYcmNrQVR5a3B5?=
 =?utf-8?B?YU1zdk50N3NVV1JNS1R0Qi8zeTcvanV2UEQ0a3FDdE00Z2NPMlFiSUxlOXdJ?=
 =?utf-8?B?bE0renBuQVdXVjFXUlJmR1ZEbTZHREtBNk9QS3ByZGFHR1RyVEZSalJwRHY3?=
 =?utf-8?B?RG1pdDNWSnZhL242ckFoTUduMTd2c0EvZ3dnOGVSOUY1Rms4dklQK2xKdWY0?=
 =?utf-8?B?TElKS3ZUMThHY0dlUGw2L3JQOXB3RXQzYVBid01zaml4T1RpU2xGaElBa2ZP?=
 =?utf-8?B?T3BiMlFEQXpCbUlHV2VIVndGd0p5MlluYUloSUphakJTVGxHTFBwK3M0ZS9y?=
 =?utf-8?B?bEthS2NEVit4WmlUM2djTjU1MmxaMGZFbERqSnpScGt4RFVaSnNHbEpEZmtM?=
 =?utf-8?B?cEYyemRuNFBOMmM4bm5RQXdaeGFic3ZzYTJuQ0lCZDhYeUZZMDRVak9iblMz?=
 =?utf-8?B?djU0eERiOHhTNDJFa2pUQ3FvRVo5UG1qbE0zZ1hQa3lIdXhrK0dxRXVpQ0pH?=
 =?utf-8?B?K0tMdTNOU2dheDZVS3YycWJwMkVZTEVNZ1NHUEp1ZDE0VmZFTXZEWVZnTjBs?=
 =?utf-8?B?K2JiYjlKRzhhOUw1aENDMEJ5Vm5aVFNoNWZ4TmtyK1lVb1dhZlZ0Z25wL2cy?=
 =?utf-8?B?dFJRYW1lRWVGT0xZbWhTR1BZdkhVNlYwZEhuTENnRDM4S0RMMHNNVmJmOGFi?=
 =?utf-8?B?K3N3b3pYSXMwVVlXZU8zbzlnb1lPc3BBbjBmTzBIcS9IU2VLNW1ZWUdFanNj?=
 =?utf-8?B?N1U5TEhuT3ZqdE5qOFVYa1prME5saEsvRk5EcTlQSy9abUVub0lWbXNtL0hy?=
 =?utf-8?B?OGRLdHJWSTRxekJWSkllQWxiRkpqeStSWXNzQ2tIekhzVWlSR01hUnZvWHBG?=
 =?utf-8?B?V00wQkRTZmkwMi9SK0dPRUl1MFVvcEp4SW5FeDVJZEZValNRR0QwUkd5bkpy?=
 =?utf-8?B?NE01bldHRVIxT0xjYXZHKy84ZDNpREtlelNtdmtIM3FaMnZyQ1VmSUM2Q3NE?=
 =?utf-8?B?MXZ5ZjNFbFM5d2JmRW0wTkY4aUZLT2JUTEQ2TGF6dnJycUQxZlVlbjlQaU1N?=
 =?utf-8?B?V3B2V1VZSEgzZHF5bFlybGZyaWVZanNFNDZrU1NFejdYRXU4UlJOUlRaWXZG?=
 =?utf-8?Q?yj3t+7ckqga1P?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHFnWTdBaTdrcWhoYVVxd3o4VEdHT3RnQVJ1SVovVVlMM1l1TXVPTnp2bGhP?=
 =?utf-8?B?VEtRVytEQU5WWHJrWVFGbCs5dWdpbXRsN1hrY09sUGFNcFl2c2NlakRTelFR?=
 =?utf-8?B?eUxEMTN2aGhQZlVjTGpHbTdEemt1dTlBZzBtSjVkakNaMmIyUzNvTEJQUEVx?=
 =?utf-8?B?djVOMm13eE5EQlB6bGtvQzJ0NEp6OVZzOE5DZFNsS1JQSllqeW1rcitSME9W?=
 =?utf-8?B?NEowQ3FiMFVURDhBckZ2V0FILysxQzZjQ2hnOTZKYkxjK2lYS2I0am5uYzB0?=
 =?utf-8?B?aTQ3RjF6R0ViZXI4elVvOVJldjJ1SWJtOUFhbGhOSnpUK0RyUVNGTG04SXFN?=
 =?utf-8?B?eUc3cllPdGY1T0dBenlqclk1cm56b2FjRnhtd05MQWY2MnZURTBITzZmMkxK?=
 =?utf-8?B?UHV5WmVTdThUdk52aVJIOEFnSG1qeGFrR085MS9ETExEdVZ0ald2SDBRVFJH?=
 =?utf-8?B?cWRCb1VNcW5hcjlTZzhmL25sL0NQeVJLMk9rZWZLc0Z0QVc4aEcrZjVORjBZ?=
 =?utf-8?B?c1diMWNMbEdJcmMzRHd4TlVicDh2RGh2U3htV0RsNjV3UTdPNytxckpUK3lr?=
 =?utf-8?B?N09aL1VlVWZTTEFqcVNPZFB0anhnWXdYcmdUbXRRWFc1YmVDbVNjd3hhWVly?=
 =?utf-8?B?WTJvd1dadDY5SmFwVGJQUmwraVQ1dEdhOFJSMzNMM01pQ0Vrc1pFb0E0Mng4?=
 =?utf-8?B?cytnd1JibytkbEYwL3NRR3BFZ2pLMDNlejM4MUwvWmJsVkRBSFd6SkdXUUo4?=
 =?utf-8?B?RldITTExQTkwVVlGNkVpSnhQM3VOVFRLczl3M2Uxdnl3Lzd5Rll1cDloM0ZW?=
 =?utf-8?B?WjNXczE4N2FPV0g3Zml2R01lNnNZdWR4L3Y4aGZXajY4M1NwaXdTR1ZXcEli?=
 =?utf-8?B?ODNkcEtpMlJrbklFM2M3dUNkYTIvcTJYL2tNbEkrWTByWm1PRjdmR0NITTdZ?=
 =?utf-8?B?Si9lRXlBY1N4TGJYVFcyeTR4SFFhaHZJQXN0c08rZzBvek8vWDREUGtKU2Q1?=
 =?utf-8?B?Ykh5R3ZmZE4rdnZzd1pUVW9xdEFjVkxPaE4xZ05sU2JVWjRXTlkzUElWN0tV?=
 =?utf-8?B?OWhNUnJJTWNod0oxMTNTSG1tQ1cvSnFlV0tsTFpKaEJpYUxBSlBLZnQrdFpT?=
 =?utf-8?B?dHVvS1BjdmJmRStrNmNLdXhWb01MbDJnZkhTWVR1eFQ5ZzFyZmtUT0IvTEhN?=
 =?utf-8?B?MjJzU29zVVE1Q1l1TEpEbHNVWjVtT0g0d3diL28wVGFhdVV1NVdybHYyeDEw?=
 =?utf-8?B?S3o0RVg5WGhFNmc5QzJqN0duUzIzd0ZLMmY4SlVOaHVLdjlxajNKdDFuTkhv?=
 =?utf-8?B?TGVEMlk2Vjh4Zmw1NHBDcFl1WVVnL2cyeU81SS9wellsTjJpMjJZZ1lsVWpS?=
 =?utf-8?B?Z2JJYnZMRjIzdVBZTGxITm9vajUwQTVDbFZIcXgrUkJlcnJXQ2VOYXNIOXBR?=
 =?utf-8?B?VHorNnUyVWE3SXAyL1JLTUVaalo4VHljZEVvMGk4a2E0YnQ5dXpIcFBLbW5B?=
 =?utf-8?B?MHdwbjhHcUhCMXdOd2d0VXJITTNOZmZhbFdjMkZiMVBrQVJXZEdKRStnMU5q?=
 =?utf-8?B?ajgxVmdNNmtGcXFHNHh2blgrdmhJMzg4OUxxaWVXTUJIQjkvMHc0Vm5XZ0Vn?=
 =?utf-8?B?aUdIZEI0cXpxaFgvQW55cmVLZDdxK2NuVXpRME1tVjRhcWdYV2dSYmJ0NVAy?=
 =?utf-8?B?Sy9LelBPRVVnN0JPbXNMUDBzQVF4OUErVFRWVzEvd2g3UFVxSTlkR2F1bUF4?=
 =?utf-8?B?NTZtWlovc0VVaUpid2VZdktrZm9SS2lsUHdnWVlPRnREWUcvdjBUNDA1Uytj?=
 =?utf-8?B?cThoUml1RTVHVnpwZ0s0Y1VSMUVQS0tDV3BNcDZNV3gxb3BqZzJJMFhxRXls?=
 =?utf-8?B?US9mMlNjbHhQcm8yQjRTTFJMc3FYSFRHbkc1RVZxckJRSHlTckVLdnQ2Q1BO?=
 =?utf-8?B?TVVINTR3Nk1hZ3IxcDNwVFVYdXBOOExlZkIvUldUVXZmc3A3akdURytiamRa?=
 =?utf-8?B?WENiYzZpSmxGM29aU0FXU3UySTY2ZTlua083dlJ5TFVpa3M2RmN2U1oyUkpn?=
 =?utf-8?B?Y0ovTDdSQVl0eGtuWWlreTJyVkd3WEpXY2NUY0RLTzloZ2ZaMDRrZTRBNW0z?=
 =?utf-8?B?RXdmUkNhelFTbWNxR3NYd1Jkc2FvQnd2WFpRYkltalY5Y01JRlpYRDJGTldF?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 82239b08-703e-458e-5404-08dd4f4c1614
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:10:36.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zdz11T/r2OXdN71n8e6MU4Dmr5wTKjZnC23utaV0V7q+rGRyJhiUwXz+BqMGK5r/U+o2LtjVhiWy9i/9srHEtGrQjT4ssgCTvS8Wd3K8tA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10007
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 12:10:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6383

Hi Antonin,

On 2/13/25 9:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
> In preparation of more section and examples to multiconfig, move the
> section about it in building.rst into its own document.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

