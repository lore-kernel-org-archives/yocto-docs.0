Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1F4C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:16:35 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.web11.43845.1738854985483030566
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 07:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RldxGs7I;
 spf=pass (domain: cherry.de, ip: 40.107.159.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGQUj0xrWUclVmgINsTDjT8H/HLRz3yRFBQTkFQwcL4TyxpsPgEP/pGE+3qKxNdSCbR3Uab9A7sJ2Ul4DfpwsboecMKvlQLDwp5Kej75mUCgp7mbp1Y/1Ooepic7k1gzjdRsf8Xgx1T32f2pFrjgvfvaR4oyNUKWEjsyHlWfIlAeTRjGhx2pkdeaErnFGyTaSEsW1p9PRLwS9kO7eqKkmcVHDL9kq+h8DflyFM81uAdSA4ZjhFGk6J7fGozKUcBYUmik63KX+Eedipl9LrnldXVesKGsA9lkGX88AzIxgVEeKhETATsTdgFAS08VkhP77+C0wVWXBER0jLEXejlesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S86y1ocLnAi01RH1H0l9m80v8I25VBVKawMhCmMxs5Y=;
 b=RFItBlistpR5x9Pw/AJgG4ygL/qMXov7gHH0afJkp4ka7I7bppYjFPplN7z6rLhhYi5aRsYbKcB3tI1H5qVbNulaOF9dRXcvPdkJfTfx5/d4C5nmQSyGC2Op2Lsf76C6t1QOKuA1GP+zOga8rUXlvXrcR3o712t0EoWQ205CVWcGbeNdafC21lAY40md9O3E2LG/mH7XBz1gJ/abJKIY19RNf19J2OMSgXofqLuWnbUl1s6yB554Iig6CZevmTZVpwUI37NFfcnO/B1JB3vWIL9QXgTsQT+vVVCeQrekOBH3qDNfUnnJdncywT/3wmG0UeX1SRLQcj0kDlnx67QNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S86y1ocLnAi01RH1H0l9m80v8I25VBVKawMhCmMxs5Y=;
 b=RldxGs7IgO/GP+YnAqfzajaR5XoBOFBpu4mQX4tlLRBz54EokLy4eNzn/cDHnb9lZJMRVPCP6yORNsV+e6NnXdzHaembwk+sdShe8r2Tjzr2Mvi1oq+zpoywm1QP7yULxGJBsDmOGUsC8HO0Glg1facNp7Hf4h/vMgbE4nreF74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:16:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 15:16:20 +0000
Message-ID: <99a48ae3-ca5c-4ab5-bdda-fbc3f0e2d8fd@cherry.de>
Date: Thu, 6 Feb 2025 16:16:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: Add missing variable
 IMAGE_ROOTFS_MAXSIZE
To: Pascal.Weisser.ext@karlstorz.com, docs@lists.yoctoproject.org
References: <20250206132012.359126-1-pascal.weisser.ext@karlstorz.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250206132012.359126-1-pascal.weisser.ext@karlstorz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:802:2::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcd4955-237f-4350-858c-08dd46c135ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TGRwTlBNMWdvZHdGNWx1dkg0amJzVjFjVmFvbHphbFd5TTJxaGpvNlFTM1RD?=
 =?utf-8?B?TDk5RVZvQ0NrUHJ2bGR6ekhiN2daRTE0S0ZJZjRpdUFUakE0bmZnUGlEdUhB?=
 =?utf-8?B?R3JYTmdxRklmb0huWjVNNVJKRXV1V1U0OGpncEJrcFU0cG04L1AzRENnZUVQ?=
 =?utf-8?B?LzZHa2Evb0ZYQWRvM214MEtSTDB3M00vbFBCeElHMytieE1SUVhIdWQ5SGZT?=
 =?utf-8?B?WU9RcTFPVitMM2c5ekIwaUhkbTNndEZFcUovcVV6cFpBVHpBQkdXUUpuYnR2?=
 =?utf-8?B?aGttdFo1N1ZYS241ckRFaUlSeVp1NWZOMWR5bHc3MzlOUFFhbSt0ck13elhs?=
 =?utf-8?B?cTJYQzJWT2R0UWIxbGExblhScG16NDBvdHNNZlkvWFNXZEpWQVptL0xuckFk?=
 =?utf-8?B?V2dKbmZDQ0kzWElVQnRZVFVXcklkZDJ4ZlZ3YS9uMjJRM0JqcFA1Wm13ZStw?=
 =?utf-8?B?aFF2ZTBteVZqWGlveGFTaGkzMDBiaFh0WHVOdXZDZTZLWjFUc3d6bll4VWJ0?=
 =?utf-8?B?eWJwc29zRU1iUDVsdkhmS1ZWUkV0UE9MWFk5RmZDejJmRFNRbEtzTzVkODh2?=
 =?utf-8?B?UFI1Ujd2bmVzcUoyREx4a0I0Si9GSittUk9aeXFjeDVuZGYwUGZmL0kreW52?=
 =?utf-8?B?SVJxVGZLTUVTNWNXQzhjQ2xSaWhqUzVFN3hTeXV6RzVJaldVNVl0ZlZkMkRu?=
 =?utf-8?B?M080ajc3WUNoSjhkUkR0S3hxL3VOSnVFbjhkeDk1Nyt0SjZXWHhPUzRuclNE?=
 =?utf-8?B?QUVqblY3amxlTkdKY292WGdNKzhLMkZ2RERrVFpCZjVRa0NPaVNNazFYMFJ3?=
 =?utf-8?B?bk41OVRvZ3NrMGk5V2xBZ3VvSHlvcU5xQUUxWWpwNWxqRHcxYnNRQU5OS1NR?=
 =?utf-8?B?NEpocSsvNmlYV2psRE9WWlFqdGNmcEdQM2UxbGlCQml0R2VmTFJuR2RvMWtG?=
 =?utf-8?B?K1lQSDBTWG1jMEo0MGZ0czJGcDh4Q2xQRVFNNlFETW11Q0NFRUYybjNJUFlG?=
 =?utf-8?B?NXo3cjIvNGtKcEZqamhyck9UYTdQZ3JDS0lERndVQWVnaVpBNDdxcVJzVzVz?=
 =?utf-8?B?ekdXdEw2Wk5ROW1mQm82Mit6ckRaWVlIRDRlQW1nSXNHaXMxZEJGR211UDJD?=
 =?utf-8?B?NkkwOWIvTURPL0xCNEZUcm5IQ0pnMmJ4eUFsaHhlM3Y5RndoelBrL3FTTkN5?=
 =?utf-8?B?MS9KY2NzV1hFa3BDSlRJdHJBKzZVRXp6cGtlbW1YcWNmVDhPbk9aa2JNS1do?=
 =?utf-8?B?aEd0THZQbFNzOFFqcGpUTFQzSGlkcU1GYnUvbW56ZkVRNm10OXVQUFdtSmJS?=
 =?utf-8?B?eE94cnAyZitLdEFtN0FyV2ZYaXQ5Nlk4SnM3bkVtenNZaTdpL2JFVjFRRnZF?=
 =?utf-8?B?ejNQdDE0WGVFWHN6NFFJYktkYStjaysvZkpwd2VhZkxVSUJWa1N5MkNpbEpk?=
 =?utf-8?B?VDZpMWczYWdJV2hJZkpjWDFrY1l2dGEwR0ZOekliV1NCVURwOWlwQkNHZEph?=
 =?utf-8?B?US9iQ1NyMGZoQW5OZWprRCtWTEk2TlNNTGtmMm8rcDRxdXdQQXBVbGFGYllI?=
 =?utf-8?B?TEJmYUkwY3Z2elZZb0tNQmNUOHBNZWZTcGFZRDVXNjgyRUFwbDlmdkJoSkhF?=
 =?utf-8?B?cnpjYjg1QS9zM2k1VnppQ0xJSm45U0JDZW9LMC9ZR1pmQ0hiRE1NY3JvZUcz?=
 =?utf-8?B?TUY1cjkyOVBqWXFuMTRkZUpZTHlOMWFQeHdWdTBpdDdyOEp5RHZUSDlQL2p0?=
 =?utf-8?B?UjhWQ0FWVjArQ01xcjlVUkQ3TVZBOHVJQzN4eWZ4RTNmenUwa0lVZzg2WldN?=
 =?utf-8?B?ajBKRWtUYlprU21VZldFWG50aGQ4bUVMeVVvRXBwNVNWM3NHTTRCMWMyTlg5?=
 =?utf-8?Q?F3XDesI3nDCHI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?em1OS3BKTlR0STUrb3M1dVU1R0NKUlZOakZzeUZEenN2Vkt0RlNJNEhrRU5O?=
 =?utf-8?B?NWdHWDY4R3lFMjRsVi9GaE91V2dVMHVJUXNPSW9xRndvZkF1d0tSdDZhd1Ni?=
 =?utf-8?B?SzhuODhBZ0lVVm5qZjhSRCtDdjI1ZnlaOEhkdmErZzFUMmR3a0gybHVMWnFv?=
 =?utf-8?B?WXhvZUxJNzF4RFlINitFN2pFNWF2WENCNHg4M2tMTlFvQytUa1p0dDdkQ3hp?=
 =?utf-8?B?alhlZGJzOWFhN1hiSC9KdStQZHdCZTAzZk9UOGdSZ0NMTGI4Yy9oWHl1NWR2?=
 =?utf-8?B?T1g5Yys3aGlPWVFmSzk3RUlpcGZQbUFhQko0ekdJQ0E2QWNieFVWd21LdnNJ?=
 =?utf-8?B?dVVYTGpMYTMrUjJHTjRFbzd3UXBzbDFIOW8yOUxmTU4zVXFTNHQyb0h3Q3dl?=
 =?utf-8?B?UzBzVTE5bityeGtSNFlBc0VVRHJsOWtLUUVGY0JxK1NaNENFQ3QxQ0hwOVRS?=
 =?utf-8?B?NE9Ycm53c1pXeFNOamVxemQ3aUovYXRyc2NHcmFvdVZUVEJ6RFdnanNIdnV4?=
 =?utf-8?B?emlpTzU2T29jK2E0TEZRV1UxQlkxTTd2ZHpNNTRFMEdMdDc0d3Z4VTZGajNS?=
 =?utf-8?B?a0V0N0NVemdWWFZrNk9GK3FLcWduc3FsU2R3QkNXTUFxRS93bG5RN1h4U0JC?=
 =?utf-8?B?aytwbk9haUZRQXFHUmFIc0FhblZqZ3VrN21CMGFPT2RQL0JiUDkwdmNTVUNi?=
 =?utf-8?B?Z3ZFaTFybWNyM2UvTU9laWNNWGwrMUdreXp3NHdWMXpPU3kvYTZCUWVFek95?=
 =?utf-8?B?bHlRUjJGREt6cy9BR1ZFckJRcUZUekxtZ1hFb0dHZnAxKytWQUlMVEhKQWt4?=
 =?utf-8?B?VU9SY09zTXh4RU4vZ0MwbG5iTGNaSDNqUm9MT3RPQ1lBNEZDdkdTbWcybmhk?=
 =?utf-8?B?RklZOXFUcTdjRlBtcXRZR2pocndLVzRyWitib2Z5OFdjMWUxSjlZQ2d2WGMy?=
 =?utf-8?B?MGhKMi9HWTRHalBJNFlObnRNTW9IdGlpeFA5QWlMMTgrVEIxMTJBMXliU1Zm?=
 =?utf-8?B?ZUc2WDJXN3FGN1BNN2pOWWM3Y0JwN24zcTIrbGd1d1JoWFRwaWxzVzZFSHkv?=
 =?utf-8?B?bjVGVW1DUlR0QStremVHMnA4UW51ZThudGk3Y3djMDJNc2kvZ0VVVEV2QmNt?=
 =?utf-8?B?dVZkMjh6bG1xc2xoZEYvSTFkT210R3A3Zm9IZWxuTTAyWWZXL1MyL2V5Slkv?=
 =?utf-8?B?SGlSNzd0TGRkdFkwalIwMXhBdCtNTzVKWXkveWtKVTROamdvaExUN0NVLzl1?=
 =?utf-8?B?NW5WaXo3Z0EydHIvNEpuTTlXaFpscnNZWE55WTlGWlRFbzhkWE1qS2pOTTVE?=
 =?utf-8?B?VWpBV0dEYnJoR1ltd0tvOFc2WjdYVjdVc285dTdCbzF2LzgzckJnbXM5Rm5p?=
 =?utf-8?B?SDQ3aHI0ZnpGdzRSdHdyOHVEcWd0L1NQNHphVlN3N2RneVNqcCs2b0VjNSty?=
 =?utf-8?B?aGM0aHQrUmlkTE02blZIa3Y2RmhjOWJ3Q2hDbWU4OXUxZ0ZlNmZYQ3VydWlH?=
 =?utf-8?B?WXpZMndlVUJmRlNMWmQ5bWJGMG1URVhnY213enNjSnR2azR2OGtoZUcvWVpz?=
 =?utf-8?B?RDVOOEh3aGRPOTVwRGloNHlWbU14elVsMHl6eEthMVdFZ011dStGb2o4WFJS?=
 =?utf-8?B?clRZZmNFMzZLL3hUSG9hNFVES3l2MUsrdUI1anVtWUFUY0lPSDFHblRrazY3?=
 =?utf-8?B?TVVwN1BpOS9KcDZuSlZGQTBWMnY2VkhhVElmVU1XNEg1R2JmY2RWM2plNGJh?=
 =?utf-8?B?VXR4bC8yR2dHMEI3dm55WkNaZ1prcklSUkRReWtsZmZpUlpzYW1iVFN4THdo?=
 =?utf-8?B?NTZ2TzJCSmpCSXljdFhFVngzcG9yd09RdEZzL1JEVzdGb05ycFl1L3llWUh3?=
 =?utf-8?B?V3dZQlVDZW8xamdjSDU4MlBScko4WEhWWFJaSGdFbW9hN24rT1pOQ3o0QnZr?=
 =?utf-8?B?c1NCcUpJME93SUxBYTFtcUFPVGM5WnVTTG85UUduUWNhQ3FRdXZrS0x0cmdw?=
 =?utf-8?B?STdib3BHbnhVOVY5RjB4WlRrQ2pmSlF0Y0cyQzF5VU55STVpMEdhQ0JlYkF4?=
 =?utf-8?B?TDNDc3VDQVl3UXNaWU5NQkcwOXY5TjVsVXE3WXVITlkzTzNIR282b3VtcHBr?=
 =?utf-8?B?K2ZxclRUeWdtaERMRnkwblVUVHNTRittNVFHVTYwZWN6OXduQU9uNitxTGVX?=
 =?utf-8?Q?ybvWY8u+gAe9ouuwov4WkiM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcd4955-237f-4350-858c-08dd46c135ea
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:16:20.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J10dpY54v/zDE0+/z8P5vLGMk1FFNOlM1HXyAeg9+GUTus3p+mbqnOqHpb2jMldAoau3aLxrNK+Uto/IZTiyonhkLhzceDZxS9iOuX7GlPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 15:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6262

Hi Pascal,

On 2/6/25 2:20 PM, Weisser, Pascal.ext via lists.yoctoproject.org wrote:
> This patch adds the missing documentation of variable IMAGE_ROOTFS_MAXSIZE
> to the reference manual.
> 

Thanks for the patch!

Don't forget to add the v2 after PATCH in the title when sending the v2 
(this is the v2 but it's named the same as v1, so it's a bit difficult 
to know which patch to review :) ). This is usually done via git 
send-email -v2 for example :) (or git format-patch -v2)

> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
> ---
>   documentation/ref-manual/variables.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 47d4e814f..c80696b64 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3984,6 +3984,9 @@ system and gives an overview of their function and contents.
>   
>            IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
>   
> +   :term:`IMAGE_ROOTFS_MAXSIZE`
> +       Defines the maximum size in Kbytes for the generated image.
> +

I think we could say that if the generated image size is above that, the 
build will fail. We could say also that it's a good idea for images that 
need to fit on a limited space (e.g. SD card, a fixed-size partition, ...).

It seems like we have another variable that has virtually the same 
behavior: INITRAMFS_MAXSIZE, is this something you could contribute a 
patch for too?

Thanks!
Quentin

