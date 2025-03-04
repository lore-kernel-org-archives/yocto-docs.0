Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901E0C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 11:16:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.14])
 by mx.groups.io with SMTP id smtpd.web10.19487.1741086947105314814
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 03:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iMgZ+3yy;
 spf=pass (domain: cherry.de, ip: 52.101.66.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oS85hc+wK7Pxs5WEKMBkDUUxj3zF7xiBxCOJOYpt1JHjfTuiHRjec4mgUmMM3ThJ6fkjduQosHSUjApvU7B+QZXm20qIqTs2Iq2hfRhXnddBMHTGFqsrs/biVLwIUb7iswkSZHCFH4zvfWeJgXRwuED5T100M5dJvIVj49ejgm05IDmcyNx76o0g9igKCAcLMToAZl0tdSGMB+1aambR+1meEvppdFIDCl/P79XrvFRlnZ96XsL5klI4yNRsSMyK/Oidw7v1ecziYsF/fryytGQ+OV/EK4tuCmkgr5edbiQFia+4ls+08plhDJhNuiWsraWiD6L9A5r07u8ELAsm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twXAD7UFi3Hr4Le2hc0zPo4x2YmY7jDp1M+3womYYIk=;
 b=udzOAAbguVc1yIGADMDnv/10fawsW/nAiocXhCOAipfid7b0rwprAmj+yuJfuiX3pq4sDCt1exog4ZUcQ0iZ6cVzhO0RwQ2ZgsnxnPrukhWaNEdpn8NAMbOmwUk9yw+FBi4qNkCSOUg+5ndwzAxVEvj6JJt5FAlsKDBkxLQi8J569VTh4snYH1ZifHDHnVfc/wxWKAo/ZJJr0pz6JsZP1nE80ryzbQB8ApBB7RT48UxiRPvrwi2tHeRa2GIb6C/quZMUkF6EvV1WqHUjXT+qfi6R82LHTllwBc6e2Z4dqcsD/vOOFpkrkXrZowFau+9MPVXJL7EyilmM5XVB0uRkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twXAD7UFi3Hr4Le2hc0zPo4x2YmY7jDp1M+3womYYIk=;
 b=iMgZ+3yyjSwELCdPUBZyZunBrTCgkuLTn+C9C1UGySaGp1dYpKhoEZqhBlPLVAnvBbsKOXNSRFHBo0O5JAiiPuG/tQgRdtw+KsutLtKL0N2PekA95yNBzLqkag6COlLQ2aaZ9shJhglCmAav9L3V88pu3aPpu4WMy1C3WsBwRsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8731.eurprd04.prod.outlook.com (2603:10a6:20b:43e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 11:15:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:15:44 +0000
Message-ID: <61c3ad82-4be8-4438-868e-7547a8669b0c@cherry.de>
Date: Tue, 4 Mar 2025 12:15:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/2] Remove all mention of core-image-lsb
To: ross.burton@arm.com, docs@lists.yoctoproject.org
References: <20250303172022.775243-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250303172022.775243-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f369b6d-65de-4256-7b0d-08dd5b0de783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anVaU1lGVFhjV1lyQnNwN1dlU3U5Qk1aTkFqVFIxZjFZOUhFRjJiZW5UdTVT?=
 =?utf-8?B?QWdYbEFuYkgxK1MvalF1NFVlV0k2VVovOVJGK3dvT0l0c2llalpMK3JTb2Zs?=
 =?utf-8?B?aXExMHM5UmlKN0ZXUEZEWkEvUEtOekE2QXo0UVhCOEo1SFNnSDY0UVZLcFVw?=
 =?utf-8?B?T2czdExkcDBtSHhxd21oRHdnVXhJTTh5OXZVTklYSWJRWW5YeEpjR2swd1kw?=
 =?utf-8?B?VjRHQ0tXK29mdERLL01YQjJkQVF3V3VSYjd2clN1aG5wT0Y2Zm5HNVRtaGZT?=
 =?utf-8?B?U2orb3FhblZVTjZWZmxRWjZQcFc0d2I1cmtRMlVQd2dsWEtnM2ZXNGNUZWNl?=
 =?utf-8?B?Sm1pd0NUaXlNZHBDOXVZZnNSNjV0MHNpT1BDN0xNRTF0Z3FUUW9TN1VZdncr?=
 =?utf-8?B?MFU1ZzFyQXhNUi9ob0Z3Y2ZiamxPMzRlRGVGdkxBcW1NOUVHZk53Q0FoOGZh?=
 =?utf-8?B?d05pbE5KaFQybVBpMEErQlVzL0JnWWFKZS9HSmNOMjNpeTlhSTNZRW9HZGpu?=
 =?utf-8?B?T3g4VVQ5eWhuSHBSS1F3QjN6VkJXU25HMElpdC9WL20vNmVoN2diZWhNMC8x?=
 =?utf-8?B?NDBBU2lhd0hmd0xZemZLK2pYc1I0ZXMwU20xaFFldjVtRXAyVlVOcWVYb1J1?=
 =?utf-8?B?MWN3c2FMSTdtZGp1S2tBVUthNi8xNjFPaEFpamZSU1lhZ3JvV2c4dnJibGIw?=
 =?utf-8?B?T2hXTmVyTHVTU0grMEdwSklZRjNSc3dGbHVEWXVkSnhwVzNNNVB1ekE4L2NP?=
 =?utf-8?B?QllONVdoa2NZRHRrR0ZOYlozUEpsTUIzaWNiTk1mWDlMeGdDZTlrTWJ4Tk5E?=
 =?utf-8?B?aHJPWTlJSjlzeCtPM1lJaTJVTk40RWJYSUt4QTFqY21GbnJSampvT1B1enRE?=
 =?utf-8?B?QnFYN2pyUVV4d0pCNUorM3h1NloybGdhank1MkxBN3FFMzRMUHo1SC80cFdW?=
 =?utf-8?B?YTBmbmlvcmtSVUhZSldKeklRUlBMUkRXQ3hQUXVja3BPVW1WQTVMUzJKRVcw?=
 =?utf-8?B?TW5WSnhGdzkzVVFUcm1KRlE2bjh5Qi9aRjViZ2J0QWFFK3JxZHlmSEhkM0xx?=
 =?utf-8?B?STBRL0tpcDFiVm0xNzhVaXFuV1REQzVnVEsyakU1MEFBVFV4SnBKcjVDNFc1?=
 =?utf-8?B?RzhWR21JcjlueDl0UjR5MVdnU05kOUtSZGIrZG1qSXVDNEFnUU5CdkxRR0pz?=
 =?utf-8?B?TGJab3lzZVg3a2NLdU1EakI0djZQa1pldjdWRURyenRqektHS0VOK2wxMHNI?=
 =?utf-8?B?ZjU0YUczYmR4TVo2YlFJRmRiRml4Z21SNlgwdDRJVEluTWtaRVozU0JKRmE3?=
 =?utf-8?B?czNaNWgxMHJUSHkxek84TWZ6OERJQnZ0M25NcWdSejFaOFF6WlpRUGZ3aU5s?=
 =?utf-8?B?YVR2ZjJ6blhISFRhd2xCdUpESlZEdkJxYUFaWGRvVVFHb3NxT2lqU0sxWDlt?=
 =?utf-8?B?YnROMkI5K0tuQzNUdVdiZDZpZUpnS0xrUEt2Rks3am9LWmlrbTZvUkd0Tm5y?=
 =?utf-8?B?TW96d044SnROUzdHdzFheGVyZWgvak5OQ0kvM0FRRzNqamtyRmJhUVp0QytO?=
 =?utf-8?B?QjZ2NzNRaXl3OU1tQ2V0TndHWGtBSzY0MXh5aGhiWHVFc2lpcG5DTzA5UFB1?=
 =?utf-8?B?ZVZidzZBb0EvMHJ4WC9TalhpdzVyS3Q1L1FYOEVQbmpIVjVKZE1GdndJS29W?=
 =?utf-8?B?QzU3bkx3YW1UZW41eEF5ZlFwMUVWVzdJQnFVQU9HQjArL2tVVmtQT2ZwektX?=
 =?utf-8?B?N3F5c0lhd1lDUllRZTM3dW0rend6WGdrd2dJSzhtdUpBWksrbkFBam1WaERh?=
 =?utf-8?B?WkgwdHo2SXdjamM0M2NqK2MrZUhqR2M3N2ZDYnV3bEdVenV1VHNhOTRVT1V0?=
 =?utf-8?Q?DJHdrIvJc44yW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTg5OFl5L3NPUE9saU4rS2NtN2huU3B3c1JtZ1RDOGlPUmhpRU03cng5NGxo?=
 =?utf-8?B?MWFKbTN6SlFheFBxNTU2MFhldnpHanBuVm5JcEEwQ1dJcWVkSmV5ajJJRzc2?=
 =?utf-8?B?bzYwR1orZC9ob2w1RGo5aXdQbVl3WS9pUmM4Qys0aTY4TXdScE9MOXAzb2th?=
 =?utf-8?B?dVZ4RExNd1VweUh6T1dKM2xUTFY4M3BOTzVhQUpPWmFBOEphb2hDbkpLdWlH?=
 =?utf-8?B?aUkvYXBEalVBZDkzWjRCV0tGMkFieVVOaFF3VVNWYy83T1gxNUVMT0J6VGxK?=
 =?utf-8?B?TmlnbXZDVUo0UjRabExFa1FyNExWUVE0Ti9TZkthajFFVlR2VEcyZHJiNUhs?=
 =?utf-8?B?a25MVXc1SndwL3NuQ1JYV0ZLbUUxSUVHYzZQMDFiK3ZIb0tMVVZDMDVqaGFS?=
 =?utf-8?B?MTdwaWwyWFhDMmg2TTV0T3ZlUlZYbk1xb1cxMDNMV0lzdHJrVEVobzBoZzZm?=
 =?utf-8?B?MHp2Yi90RDY4RTU0b3RnWnJmUERXaXNvYkxycWIwZjUxZUpTM1BGSWVRemdN?=
 =?utf-8?B?VE4rYUNPcU9IeEJESEJIak9zekxFM3hTNExlWTI0YzR0dHhKY0lNTjE4VnBJ?=
 =?utf-8?B?WWMxZlhZdURNQnVGSHJrbXN6OVhmc1Uxa1dKeWcrQ1VlRDdJa1RQQUhyalFV?=
 =?utf-8?B?M24rMENsWEg4UDlNQ3VoaDJWR1luQWNpSU9QT21OVFNqald2cmJOVHRTUjhO?=
 =?utf-8?B?a1FDREl5QUJmeEdsK0tyd0NDUkU3b3N5Ym5WYnN0TS9GejlTT0Z1SDdrbjZV?=
 =?utf-8?B?L0ozUitvbVhPOEV5YmZNejlqanFkNkl4M3d0b3owWEhuLy93R0N2WVBrQkNL?=
 =?utf-8?B?OVp2TDUyUVJCSitNRk1HTjB0YzBvelg0OFl4Wi9vU1hLTDc5MWpYd0pNS3di?=
 =?utf-8?B?SjFoZnJlRzdodFFVTGwzV2dpOEZOQVFuSlhkWi9sYXo4TThLTTY5azY0SWhs?=
 =?utf-8?B?amlMczcxWnVkMllBNTdpWlBEeG9xczhPWUZkUFdhTXo4aUlCZlUzVlFIaGtD?=
 =?utf-8?B?MUg4eHdLb2VCN3VhSWt4RDdxZElBMlpZWkpTS3FWc3lmalVkZ3JYQzJYVS95?=
 =?utf-8?B?QlBEb210cGtRMG5hSVYyRFZSNk1hdFFvNFMzWEdPcXJlOWZXVzZGWVRYWmJO?=
 =?utf-8?B?N0NZaGs1MjlhMEtjandtZ2x5eXpsK0hLeXdQN241Z2djeGFQVis2M1BpOWVQ?=
 =?utf-8?B?V0tTTHhuSGxSd2lnMW1Wb3Y1enZHanFtWS9wWlQxUFRjM0d0R3M0OURQZ1lI?=
 =?utf-8?B?M3cxSklwdUJNdXVZRklDWG1Gc0RZNUU5ZjFnL3NtL0kwQldNNnJkTnN3cGtE?=
 =?utf-8?B?SDE1MTRNYUdwTFRFSDdVY0w4cnY1eGZNb0c1K2JJdGQ2WHkrVDFYL2NKdUly?=
 =?utf-8?B?TkMvTnZKN1p3ajZLR00yeVBMNzg3T1hVejQ0d05HRmF2ckEyamVoUmJXRGlI?=
 =?utf-8?B?SFNKOUV3dVErZnFSQ0JMVlQ2R3N4clpyRFU0ajFTQzIxb3YyVStVaG1KZytO?=
 =?utf-8?B?Y0ttcGVQYWRXenJRQjJrdTVRRXhJWFdGMkVxd3dadEcrRmY3QlFubTVINkht?=
 =?utf-8?B?NSs4RytaVE5KcE1CQnpJS3dWM2JzckxQKzJ4QzA2TEtMZmZqOFRWSkZqR2Jp?=
 =?utf-8?B?NHlPbmU0STV5aFBJdkt4eWJOb1EyVmNsaUNxb1hzWUZOUnN5SXg0MDJMZ2NQ?=
 =?utf-8?B?d2xqU2RyOFhVOEJHQ2V4OEZEZlV0ZUxSOEl4M21MYlZPeVRUWVdCYU5DVzNm?=
 =?utf-8?B?b0RwQjlxYkdlRm9jWWIweVJhN1JjM1JkeXpzdHJmMm5lenlpNkpZdnBPK0to?=
 =?utf-8?B?ZVpwNWFkR3RhUS9JZHNvcEMwNk1RM2t6T1Q1QzZrY2x4bzdIdW9MRmRhTTRB?=
 =?utf-8?B?WHdwVlo2WFc2MmR5Wk9wWFcwbFdZd1R1VDR6UXpKUUtMUjZOL2FCQVUwWThP?=
 =?utf-8?B?R2tBVHZqbnJGa091dUZvOERsdDVPRXh5cFNjMGtGMXVaMmdQZERPdFpFSU55?=
 =?utf-8?B?d1pWK0p3SCtMeDk0WHpiK0RzSUpJUkpDVFpyaWpCYThVTWhRUnpic2UxNWVP?=
 =?utf-8?B?TGpOSjNCR1FCT3l1L0Y2eE84T3ZtYnFNZUdlU3pUaVVHTmoweUJDR2tVS3Y3?=
 =?utf-8?B?L29yUnUwTHRnd0tSd0ozY2YxVHFqSDV4WVdUN3F6eHFmRzNuQ2xyUXdIVW03?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f369b6d-65de-4256-7b0d-08dd5b0de783
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:15:44.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsAI06fU0Nap52HLR+fOwMzFk1wuaqCcsuarCevyOFN2M+ffkBsdmFCfX1catx9yykZJh+cfptlxPwwuUDqpp5pKcLWDhmZCPRT4zExGWZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8731
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Mar 2025 11:16:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6496

Hi Ross,

On 3/3/25 6:20 PM, Ross Burton via lists.yoctoproject.org wrote:
> core-image-lsb was removed in 2019[1], so remove all of the  incredibly
> obsolete references in the documentation.
> 
> [1] oe-core fb064356af615d67d85b65942103bf943d84d290
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Can be backported back up to Zeus.

Thanks!
Quentin

