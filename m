Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EC5C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:43:41 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.50])
 by mx.groups.io with SMTP id smtpd.web10.58511.1739209411555649350
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 09:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AKih2sNb;
 spf=pass (domain: cherry.de, ip: 40.107.241.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wH5tw9uxw/mPHL+neukCGLAYDngQzL1AU77KRrjLJ8kf0WXvuCaxG24Upq4W9OuEgsqSjT6/6S67BMknFYiuWen4VgGm5CCyAhXKu+53TVSoJutGg3tQMzXt5QWKggO00UvEuy/OS9fKEE4gReBEkB8lV8yEs+uVNASpAg0MWE2QzCyo8FWwEOluwEZT+ZPLfoAkuGc0VcHbx7UXOQMyL0pKxv8dTXmZj9r76KTrcoRG9cFcQF854syqGGjFDYHnh0J6m1Gv5WrfxxzNhxyMs4iAbmtQZxjOubWtsfhNBViIcU2MG/IlSxGaXz0GUhE1SkLO4Y/OSfw4NUHJm7AY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJ/EvCkdri8OQCdPDCtQP8I72qSLLCowf4NaT96avDI=;
 b=ZPYigmQDoJsvW2l7+wmM3u9hGQrwGKsc5IgpncSv66kQgHw8CPYphYgIBd1sNxaGOQ+ouGbLZL1+5ONo4ybzL3oGEHmEC9B6tj9QnaUIsrhdH2MLJkQdKbxDTW+keardMLCDZVHdBXyKgI3/MEpYYHh1AlElO3+ymdVRGnUHk32YLUvLEy0ggnNe4YQh1DB5JbnIxTKFvUZrrloNwqsTzWO8csLm/sUsmA5+ZJD+iVE+M0xiGmgS/kxDPidy1bNb27X/xe8Bf4cAbUSEMAbeMRTjl8QjQXvI59OYEQDendtpx6WMGaRkJAXCx2qWbhUR1CWqhGcy8WO62XnbWfT43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJ/EvCkdri8OQCdPDCtQP8I72qSLLCowf4NaT96avDI=;
 b=AKih2sNbENrOR5cjuefGdw5ZP/G3o8lv+MDQKxgM1f8MDgyY47963vkw7GXPBjKRmdEu/e/90LyvDd6G+wUIcqXorn6JqRXu5j/eIeYZ2B2sBtUUkLsMuVBXlcrHAssDKdR2RVdgsXVrD5N/fpRby3F0S66xMZg4vI5M7JzSrXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:43:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 17:43:29 +0000
Message-ID: <54970eb0-9353-4e34-b3b8-10022c3b29cd@cherry.de>
Date: Mon, 10 Feb 2025 18:43:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 4/4] release-notes-5.2: Add new variable
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
 <20250209233245.1397155-4-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250209233245.1397155-4-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:803:104::40) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: 043a046c-245a-4f4a-c9ec-08dd49fa6dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmN2anR6NkFoanBjWklZL0UxRkNuNTZTdmQzWjZ4UGR5c0liYllLSTZuMWlZ?=
 =?utf-8?B?WnZZNTZZT0tDRHZTOE5XbUxiOEU2RTAxaWZJQ0VFdTR3M3lNb1JiYWpZdkFL?=
 =?utf-8?B?bDZlQjdEZmJ5d2ZWTlhiV1ZubFlXVnBzRC9OZjNYYTRDbXZJWFZpN1c5T0hG?=
 =?utf-8?B?WmdYSUtXb3JQWCtvamlIVGlnTXN0TnoyUUhidmZaRngzbFhDUHFrQTZCSFlM?=
 =?utf-8?B?VkFLTjh6ZHg2c2huZW8wWXFkNVNUTTlsdFkxdVBNSHBhaVR0OE0zVU9Dc0xQ?=
 =?utf-8?B?QmY4TEloV0EzOTBzc0tKOWJaLzlkQTNoVGNaYlNlYysrOWdERlJ5ZkFGY1FG?=
 =?utf-8?B?dSs0YS8ycVhHNERacDJRN25RQTczYkdHRWFWNGt2YWR4bFk4dWtwcFU3SlB2?=
 =?utf-8?B?Y0ppQ0VKTGFPTXNTUzBRUkhkdjJxRHJPaU1EcWErQzg4TS9ucU9xR3NMZ21i?=
 =?utf-8?B?ZGRsb29NVHc3d3VlcjNDaDA1QzljaHZXakptcURDVkQyUHVWMU1FbmJtWksz?=
 =?utf-8?B?QlVGSmw2Y3o1Q0FoMzd0RlhhVlNNRmVKMjc5dUpVU3NxOTFGYi95Um4xWTZT?=
 =?utf-8?B?NXU3bXIxc1k1NWc5bVJZamk2VXpXUndTaGVCT3RtVXZ4dlF0OHE5dWs0OUJy?=
 =?utf-8?B?NldGaXdPam9OTjY0b1YwVEN1RUsxUW9wMWxsQm9PNkJBamNxR1BUdi9EQ2xm?=
 =?utf-8?B?NGxrRjJsUzFOQTU2a0Y5MXBaMTI3SnZQVnA2QWM3VWZWWG45MWt4MWVVMU1F?=
 =?utf-8?B?ZVdrYjFQenhXeW82SURqU25EMFBJZnNBcUY2NkdXRnZXY0h2ZXFLMk9hNFlB?=
 =?utf-8?B?dk5nQzZpb2tUWFIzZVNyNjVoa1BUZlNnYjF2SWJIWkU1OGtKQ2RzRHB6aEVC?=
 =?utf-8?B?cW9jNU5oaFNOZG04RDI4VmJJWC9FSnhMU3lCSzNOaVg0MUl0T3BVZjdvdlNm?=
 =?utf-8?B?VVVLaEpuelNMdE0zd0d3MER6WXFiZzlSQlloeE44YUtOMkdpV3VUNzJnWm1v?=
 =?utf-8?B?OXVXa3pUeXQzVWNDRU9FdGV5L1RWQ1BZakMrWndvNjVXbVhST3JRUEdYeW5S?=
 =?utf-8?B?bXlDcEJlalQwRFN3WG1CME9QWk5wc2NyaC9nT0RsWlM0Q2M5aEYwTG1xbmgx?=
 =?utf-8?B?ZXUyQmxBWEVPSEFqc3QxK3N5MzNrdmU5ZmdjQTFNcmZNZjVNWTZpdWVUQkhi?=
 =?utf-8?B?NE1QWEViUTJvU0d4TDFZbDRyOVZVOUxyU1pWVk5KYVl6dnBWMFEvUUpSNTMx?=
 =?utf-8?B?NEMyZFV2dXhEak12dHI0SHNvT00rcFBhaVdCd1I4Y3N2N2FVbnpIbVNYcG50?=
 =?utf-8?B?TkFBZkxaVE12Y1U0ci9wVGlsVjg5TVM3YjhtWkEyTGVSMmhPRTkvVHVmR0po?=
 =?utf-8?B?VlpkNU5mK1JMVFNyV09sa01MT2wwRDltNkdWdi96cmRDUGpmeWpRcFVBZ1JT?=
 =?utf-8?B?cE5EeElRRU8wcGxHanJ1aW5MbFgvc29sMDM0UTlDdU1SVXZiQ1p4dkpWRW0y?=
 =?utf-8?B?NXMwUWJMTElOVjQ4dy9Xd0xQOTBucmhwaEIvYVlnSE9SdmJNMGhnek10aVJa?=
 =?utf-8?B?SjNqZkhEMXpBdG1jVFFZSHZlRU1Ydi9PZUlBem5leExLRFhxYk9TcXJqVlo0?=
 =?utf-8?B?QjhBOUE2cG1MRjc1Y3lPVW5VWDMzOTVMUkVRS09SVStXc2tZb09JNHlBQ1h4?=
 =?utf-8?B?WDJCOUI5YTZ3WTErUzdyeDlJb3g1LzNBaVlzMmc1d0NUNG11eTlCWHNWVis0?=
 =?utf-8?B?QitwVFFucEtJSkZGWU4vdTUzS0tUN0NwQ3NIRUswSXl2djRRY000YnJtdkV0?=
 =?utf-8?B?VERVV0JNSEJuc3lYbHY1U3N5TkNzMlRZSm41akZ6c1daTkRUeUFucFIzM1hz?=
 =?utf-8?Q?TEhKcw2k82GrD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjZUcmZVTGJPNXpFVWZ5QjlVb2czN3pOZ2tMbjkyMk9rZzBuZzF1ejJrWVE0?=
 =?utf-8?B?clk2WEloUFZVZ0NGbmtQV2JNZmFtaVAvVWR2RW9Td0t4cUZybjhVOEN1Y1V4?=
 =?utf-8?B?WXp5ZW42dmF6Uk04UEVlRG1uUHNaMis3OU02VWlCdU9KZm5ObWhMT1FaR01l?=
 =?utf-8?B?YUN4eUliTWg2aTE3WWdUZHpRM2orK3M2YWJVSHp2WUs4QUJOc1FaNHBZS3Vo?=
 =?utf-8?B?cFRSYlR4KytHZkNTemxMT2E0L2RXdjBEL3B2Uk9iSFJYNUc0V3VFbzNhRWhp?=
 =?utf-8?B?Y0wrNU1OM28xc2pWNkhqc2t6N2Z5NkpNVDRKU3NEN3VTTVIveUoyaWhYczlV?=
 =?utf-8?B?Vk0xQ01Wa2l4UXVONUFVYnlZQWlrZWR4enZKemhRU1VHOXpZV010WmdLbXhO?=
 =?utf-8?B?V0hScGNRL0xWSEtmUm5Jb3laWkYxN3BZWTZQYmtsZ1pTdVZBMUhPQzZJY1FL?=
 =?utf-8?B?bkNKS1Qzcm9OWVBQS3hIMzFkRnhpY25ZYy9scFUwendPUTF3dmhHU3lGQW14?=
 =?utf-8?B?V2ZQNTVIVnRybDRVNytwWSsxbGQ5SVh6eVB0SjNvbHllbmc3RDc4aDZQZExL?=
 =?utf-8?B?V3VGRkpRaTdIa0NrZUpkcGQ2WkNoMHBSVlJ3WGJBcm1jbHpoVktLOXU1RlA1?=
 =?utf-8?B?aXo5bjcvdkhISFNLMWZvcU80RmRxU2QxaDAvRnFZUnl6eGR1aThvTzFWUUVX?=
 =?utf-8?B?YXVrdU9vc0pYUkRUMGpwUXJqcFVzVzAvcXlZYjlNT0tmVklPRGoxMDV6amdl?=
 =?utf-8?B?VzNkbFNldis5ejl2Zk9VSHRCbG1qOEtnR2UwN3Q5bjd6L1BZUmFZUUJqQW1i?=
 =?utf-8?B?RkZ6SElsVmFwUWNPRmFIU3gydnF5bW9hVkw5TDRBVGNDbGMzTFcweWNWME5w?=
 =?utf-8?B?NVJJUFBOaTRrZVRacDFxUHRPVnFqVnY2RllsZkJTVzFxQW1ER1NLZ2FvaWtK?=
 =?utf-8?B?Q1ZaOVU1UlNVTzFJd3BhSndqN1JJRDJ1U1ZhYkpvdmg1V0Q5N2E3WFMva2d4?=
 =?utf-8?B?dS9rVGVvTDBlRTNXUjFaMG5QUVhacDRqYmNEc3orcTFORjBXbWxCcldUWVIy?=
 =?utf-8?B?TlVVbWwraWVhcW9XUjFPOWhXWDU5aGhNazQ4UzZ5bmg1blVXNjBXTlZsakNj?=
 =?utf-8?B?NEJUV1RUSUttU2I1S1kwMzZTM1BHMzJuVkVieldPRk5jSWFoM3kvZjkyU0Z5?=
 =?utf-8?B?Mkl1YmN6aFNNSlkxMG5EYXFyVGVYaWhQN1dhOVFZaGxPb0JObS95dmVPTDYz?=
 =?utf-8?B?S1FGV2NWMm5MUGxOdmY4ZFVaUTg0L2pzbmZXUENJUENjeWZ2M2VnS1B0YUho?=
 =?utf-8?B?SVRuTnQ5aTRHOG5HU2dYZ245SzQrNkJUWFR3SmUzTitSbXp4NlNXM25INElM?=
 =?utf-8?B?ZXBwTDRMNHlvVU9WdlZncVJYalhjT3RONm9HZWc3a2krQzhSeGhwZUszRGh1?=
 =?utf-8?B?YkloTGdtY2pXRzNjZ29ZU0hHM252aWZKSzVKUkN2Zm5HSHNhK1RxcUR5dWxt?=
 =?utf-8?B?YkRNcGtMa0xpdDJ5cStoeS9qY3dFMXpreXhBWVNWcXFYVmNBR1E5eXVQcGF1?=
 =?utf-8?B?aVl6ZGNHeEU2dmlNNHFycVlqcDNiYWFXQ042dkdkWFE5ZU1ZVS9YdFJVMHJI?=
 =?utf-8?B?eS9IU0wzTXFHUlRVNTlGUUoxZEE0Rlc4S0FFSTBmWVR3bm5Qd3ozZmtWU3NM?=
 =?utf-8?B?MHhTSk9oVUhTN2FkWDNmQkNYd0l6NkhvL0s1MFYyY2pYZ2Fqczg5U25tWDRp?=
 =?utf-8?B?L1BxYXd1b0ZIV1JkeDE2Wk1OU3lFOEhnOWpJSHpRN2dKZHBPVllpREVsM0Vk?=
 =?utf-8?B?MGNFSHpHT2Ntc0hORlZUNWdBazdaTmxONmE0MUk2eEVUVnZ0c2g1NDV5LzFS?=
 =?utf-8?B?K3pkaERnL2F6Y1NjK2tiUE1MVGJ5QmdqSzVTb3FhVUgxaFJINFExZG1tN1k3?=
 =?utf-8?B?MmJnb2pBVFFvWmRLMThOa0VNUUs1ajZpaEJmTEd5bjFSdGhVYkNDVnJTRzFp?=
 =?utf-8?B?QklDc0dPcCtPa2ZRS0N1V0Z3T1o3Nkdnbm0zNHRXL3hRY1NHUi95eG11dUsv?=
 =?utf-8?B?T3YxT2drTU1mQVc2N2VOZTVucXJlNkFOMmd4c0F0L3V3NlhLQkh1Z0RZdHNK?=
 =?utf-8?B?T3FSdUtzQ20wOTlpWE50ajRlMUxLVjNZdGpnZWM2STVPcm5pdUJ0dXZFSlRY?=
 =?utf-8?Q?RT2BIaa13cVjee0cJzf3pfs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 043a046c-245a-4f4a-c9ec-08dd49fa6dd3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:43:29.0915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pqg5NHXO6d0pd1Gx4yfCCG7F6S9ZpyznJWK1Mj4aqyFcdwNWtr3quahgOZ0hhiHXwtM5VkuHZkVBBSETPC9/PJO588TNF7jqN0Iv0XikxW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Feb 2025 17:43:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6325

Hi Yoann,

On 2/10/25 12:32 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v2->v3: Antonin's Review:
> * Add OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS ot release-notes-5.2
> ---
>   documentation/migration-guides/release-notes-5.2.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index b0e538700..069e34be5 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -17,6 +17,9 @@ New Features / Enhancements in |yocto-ver|
>      -  ``linux-firmware``: Add the :term:`FIRMWARE_COMPRESSION` variable which
>         allows compression the firmwares provided by the ``linux-firmware`` recipe.
>         Possible values are ``xz`` and ``zst``.
> +   -  reproducibility: Add the :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> +      variable which enables a reproducibility test on a single recipe (without
> +      the dependencies). See :doc:`/test-manual/reproducible-builds`.

s/single recipe/recipes/ ? You can have multiple recipes listed there I 
believe?

nitpick: I would say "using sstate-cache for its dependencies" (with a 
link for sstate-cache)

Cheers,
Quentin

