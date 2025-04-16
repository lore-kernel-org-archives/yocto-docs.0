Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9684C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:58:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.28])
 by mx.groups.io with SMTP id smtpd.web10.15503.1744797521329422983
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 02:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HY4JsDLm;
 spf=pass (domain: cherry.de, ip: 52.101.65.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oydR5GBzUw/skzl160qF87bYlXOdRzxdbzxU1z/wXVI8UZVfk+Qzk/oSNsu51+QkhL5B+fnAD0Qnv4ZCmQCA5qHZ5XKBPfnSpz14gJa7+nv/dsl4oNArTEEXIJbHQBSKsfEiuwLQpVOw5DFp1cF3X12mkl2T7oLgo88dPRyV95kcd19gRS4gZTlDwB5zTVGJaCDnfjKDu5i4qe9Vr3q+du0Opu/L4PFo8GWCsIH8IBrHO3tpJ8vUrOsQzMe4NTXrjdATn6nwCv2yyaT5WwOMjLr/8862m02hbwxtRLOiu+tFNwWiy9Gn7WHSvXB6FyIRk1M+pyGUMgy0s0ZnSYxLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o97pycx2yuqK+j20uhwesF4ISN1Z5oKbSUIgdUMnDWQ=;
 b=kKpH9LowuZu1Zf2l0vm+G8/S4GMWKrBAcz9CmOcsGRreYOLDwUr4Tb+UDE+jD2D6Uhl1bd0Ve1cz1AWJdX2+o17ZXWJwURA2NimA5f0pZf9ruuH5mMZL9QAGTVqbX4ONRfaz/khZpsoaqJZzubjFa+t9TCDg6kQeySRXQg+w5CJ+zk/PcGrLcAhT8f8Q6AVv9KBJO5lqHVJYI8dYBEABMkkR9Mxh4ynqhSrg9jZCb73/ygZGVbOyUNsD3+INpLfCBcWMVBN+GrAtlyIPrUqQvRQ3WAbkOTPV4nqw+4drPbg3oSNQMsu6zA5Ta0P0vOQIp2zq/OaoScWXUII8VSKYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o97pycx2yuqK+j20uhwesF4ISN1Z5oKbSUIgdUMnDWQ=;
 b=HY4JsDLmzjX8k3i7ipb4iFc15iN6ujwnl6p8AYjLYmt285yNc+yjKCcbhUkXfvrM0l2hI7oAf8wqWIR9xv9Gc0LxpjZ5/QtmhE5youcSMJ0dmMD94XDoa8lfITDY24MAyEDj770k2gdu9MYKskKfWsi60osQEIn8HpuUigbwjCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8195.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 09:58:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 09:58:37 +0000
Message-ID: <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
Date: Wed, 16 Apr 2025 11:58:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
 <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9d342f-6514-4feb-ea9b-08dd7ccd422f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TU1UT0ZyWk5hSjRYV1JPak9wYk9OUEdOWlU2dEVjaGJLQWpUY1U2NXBHVW4v?=
 =?utf-8?B?MVlyWk5zVEtTQWQ5WW9HcUJRWUNQd0hjNzA0YVl3eDZvNS9nRmlNNkQ3d1Y0?=
 =?utf-8?B?QVY5QnpMeXNuRlhpdFJLU1N5UkVuZFY2L1RhRUExZkFxeng2aThXMmJvK1VJ?=
 =?utf-8?B?UnBwaHNvMlVOa2JjOXR2eWEySFZnOEwyYUM1K0pDSFh0K01oZjVKakJOc080?=
 =?utf-8?B?R00xTm1ObEF2VEorWDMvTEIvZEZGYmxBd1dQdmtGMCtIWGk2cjV2WVdiejUv?=
 =?utf-8?B?MXcwNHZnTVdkeFJRdFZZb0dtc1lHTlFtL1ArZ1J2dFFLRDJxWDgzQmFQaC9O?=
 =?utf-8?B?MzBsMzRLd1NRK1FtaGJhYjJwbDdQTzB6NktJa2hCTzMvcjEzTmhWdHZwd2dO?=
 =?utf-8?B?eTFpMDlCZmxva3VwbWdmZkxwUkM5MXAzR0hWWDg0SmZtVStZTFZFdXkybkZ2?=
 =?utf-8?B?eE56OW1Ic2FubVFNbDg5bHZ2ZDlkYXJXcnN4UlJFaG8yQkg4Mm1MSVNpc0Rz?=
 =?utf-8?B?RGo3eE9BN0RxU21DNDlsQndHOTlZRk9ZdzIzRnE2MjBqMGhNcGxjdnR3YUtQ?=
 =?utf-8?B?SjlGM0crRmk1MFZnbWlIYVRkVjkyMWlhMi9QY3dFemR2KzRFNGRMU0dKQlBR?=
 =?utf-8?B?UWNSRmg4VHFDVFNMMkh3KzBpeTJnMjZ2STg4RHFvOGRtWFlIVSthS3pQYi9X?=
 =?utf-8?B?dDZDV01Ua2twUWloMVJRS25KLzBRYXFnT3RYajF0MVk2NjRvbC9kMWhvbld4?=
 =?utf-8?B?REVzcDNPREJTVEZRODF3NU14a2doVGcrUFJvZExlU0xJdTFEUXI0QytCZk9B?=
 =?utf-8?B?MW56YlVEVi9tQnBYc3VzdllFbitPajVqNFM0Q2tSWDNpeEZSZGx5UzVhVzVo?=
 =?utf-8?B?dmd5ai94MEhIa05KSXdwTUtoSkpNb25QQitZci84ZFJWUzh2WkVZVk9pZDE3?=
 =?utf-8?B?djIyZXRPcjZQaGpzSlR5WjV4eFE2SU15UzdzMWo4V3BaWkVWdDlWVEZWcVRo?=
 =?utf-8?B?ZUtLRXIvenl1ckNtMVlwWVoxenJ3ZjU1dTlEQ2hJV2RhMWRPU1A2ZkkvUmtq?=
 =?utf-8?B?UTFiajhRZjhKWDNtS2RNTXRXQ0w1QlNscFpjT2dkU2EreGlwVzM2TSttSG9Y?=
 =?utf-8?B?ejlJU0YyeFZSWDhPY25PTkJLZGlud2ZUQi9JTzVRU25COElzOXYzTzQwOGVF?=
 =?utf-8?B?MmZTZ29lcVNQOEtXOFJseHJXMFJEdlpRR3J3U0xEMmRsS2lJMTJOb0ZYNDFs?=
 =?utf-8?B?aFNEeGd1SlkxOEh3VEo5Y2xlamloYTB3alJzOXAyMFluWk1FSlpua0xhTVlL?=
 =?utf-8?B?MFF1TzlwbUU4UVJLR0lmUjZkUTZlNXJDZkcxeld4WGpzNUNxdDBQVVRuN1Q3?=
 =?utf-8?B?d3hxMWJMSEFRRGdmc1VlWVVlaFFla2RrK3hVb1ZOUk9ZVDlDL2lrUXVZNVdk?=
 =?utf-8?B?WmQ4b2ZTTmJqaE5nSFFWRURFaVRBVEE1Q253VkhGTXgyYmZGWTM0OXJuYnhW?=
 =?utf-8?B?dCtDdGUveWJ1U3V6Y2p6ZUkyUzhCQzkwMHhteU9hUzduUUFiSEJHNkFCU1o2?=
 =?utf-8?B?U3gxWmhaS20vYmYvVTBuRUM5VmtWald1U2VSeXIrSXByQ0ZGbHVWb3MrZ2xx?=
 =?utf-8?B?ZktQNEo3c09MYnYyNk1jbEpvcmt3Ly9QVDlWR0g5SHRnR09hNVROR1dCQmMx?=
 =?utf-8?B?SUdnTDlKc0RTZWxIT0pjY29QUU0wa3B6ZFhkVUNJOTJLL0xzRTh4RUswdkkw?=
 =?utf-8?B?ZDF5dktmc2Ywc3k3RjBZdHNGdVp0SFBiY1BVWXA5V3RkdXJEaWVCS0ZmZUw1?=
 =?utf-8?B?WVJkNGo4b3NWdmpRSkZPQVJ3Q3dBeXQ5L0IveXZyR0s2MnpBUG95NDFiMWZo?=
 =?utf-8?B?ayswYU9pRlR6OW8xSW9FUk9teStTNS9TeFNTd0xBdGorSnVMakx5TWdQcGUw?=
 =?utf-8?Q?3FDrIDtL+78=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1dIRUYvVklEajU0STg2TzNTcHc1R1l6cDExUUdkTjFweEtHSHM1OFhDbytR?=
 =?utf-8?B?VmVpNHRockVFcEttRGg2SnVnUlV0cWZEMHJMTkdGek03UGNsMVZMYTVicmFo?=
 =?utf-8?B?bzBnNkdqUEJHUC94U0grSEl0Um1rSUU5dFdGRXZTU3p0d3RXRjV5ckNJYW02?=
 =?utf-8?B?Zk1CaW9CNysrWFVsMm9XSmdoWTdsU0dmTmxVRnFYZlNGQzhwTnFBcUFsb2w4?=
 =?utf-8?B?OE9rdEM3SWxRZnZJQmFzeERFV25TM2lSb1BPVUdNQ2ZTWFNIN3ZrdVdJRDlP?=
 =?utf-8?B?Y2JQVWdXTDAwSTd2c1dYbnF0UWRrU2FBaXE5YjdKZEZOQ2VNaWVVR1FtUDlZ?=
 =?utf-8?B?azBPV0JCTzhlaUVuU3Nlc3lSYThTcHNnb2lBUjBrem9UUDhzTXhEb1hzVVRR?=
 =?utf-8?B?UGg1UU9hS2JNd0pXVEZDbGlabHNzeGFnVXozanZKbnk1VTZhQ2Fjc3JzcXQ1?=
 =?utf-8?B?ZjRST25OUXQyWTQ2WWthc2JpQnNReFVhM0FueGJOUHE3UVJmeUlRckJtalJ6?=
 =?utf-8?B?d0RsOHd4S1ExSzdXOGlqMGR1U2pzZnVPRlVYYlZZVmkwcjRmVEJmM3VwSnRq?=
 =?utf-8?B?eklBcHl2M2JreDd5SldBY1NmVmRkajZZcXQ2WTljbFpVdmtVYzVUL3dXSGIw?=
 =?utf-8?B?VWxNNnFTWUVlbU1OWVlCS3dIM1F6ei8vSDNGL01Ha1hudjdOeG55MjZTWXNL?=
 =?utf-8?B?MzFreWlad28wVTlWWEN0WEtPN2N5UDRzMkFrZmdJM2Q5V0UvTmR0ZlA0Nmtv?=
 =?utf-8?B?ek5sRk9sZDU1NUFSczdvK09Yc1hWVWl0OXRrQk10czRQLy9TdDU2a2RHcEtw?=
 =?utf-8?B?V0Q4ZzhBMlg2ZjVwVHlVclFjUWJJRUpoYlBSUjczeUlsMWExblFJUnhnUDdS?=
 =?utf-8?B?ZFdpTGRGK2RsdW4yVGZwdW1ZR1lZZkhjWHdjeWtBNkpWUWx3TkFBbEd6U3dT?=
 =?utf-8?B?OTFObVhlSXlOVFA2dkVZT2o5bmJlYVpSYVlORlYveXhIa1V6Z281aWtuTWYr?=
 =?utf-8?B?cjVKMnNxS01yZnFRalhobExINGFnVEU4em5sRkFkT3NlR2JuZUVBV1dabnU1?=
 =?utf-8?B?aGZQWHcyMjl0MU55YXNDd3hGNFR3OC9Ncjg0MDFpMnIvZjhRNlVCOXVyaEM0?=
 =?utf-8?B?R2dRSVdSSTJTek9Db051MGpXck44aTIySXJ2TUVkMk80Vi9IU2locW5UQ0F6?=
 =?utf-8?B?TUxScnd6a2VQaEx2VHozdzhYWmlhM3FhclZpYnl0eUxqSW1DNHp2c1hpZFdX?=
 =?utf-8?B?TGppOGhvU1ErRTY0ZDF2WEFOS2dxcWpuMDFBa3pMSWtQRVNVb2FWOExEcEg2?=
 =?utf-8?B?MFA0UnNvUXExZUsxY1NsZkgwN1dyY0FIR0NqcWFzZ2xJNjVTbXpRS0JVdU4x?=
 =?utf-8?B?ZHZmdWxydlFIazRRYzJwYzJlZmE5ZDhKNEcwL3RBWUVweUhQbSt5a3Z3dzM0?=
 =?utf-8?B?cExwNUVBWXBEMVZvZlFwWXEwUlEzVXEwVlVHZC8vQWtUcW1nd0o0UzN2THZM?=
 =?utf-8?B?MnkrdVIwZC9kTE56azdDRlU5b2hMc0xsTmt1TUl2a2Y3ZFNnY1pIUXVwUjlZ?=
 =?utf-8?B?S2sxUHhwUlFtNWQ5R0xqOFN6YUJjTnJzYjZZOEE1QUZNN2tiV0xEVmxobGZq?=
 =?utf-8?B?aG9wUXBxdjJwOTNRYnBMR2JRRWszcUtLbXBRc1J4NWdjUDRHNTNhZi82MzB0?=
 =?utf-8?B?a3BuRUZsQjQ0Ykc2Ui9VZmVsZFF2cWlqTFh2TitlVXBLVFcrMHhCZjZGemdE?=
 =?utf-8?B?WUUwZHoyVmlseW1wN3FRU3ZkNTZJamJBV1M5VmN5emxWYktFQTdWZFo4bkhw?=
 =?utf-8?B?MEpWUGxUeTBRYnFPRkhja09QWUs5UFNscmhEdXhFUW41NHNMQkhha29zaHAw?=
 =?utf-8?B?VjVwRlN5TjAzZ3kxUFBiUkFRdmhlUmRIdnlSeUQ4VktCTVhjemZDUnF6ODFt?=
 =?utf-8?B?c1M5clJEMkNJQ2Q2bzM0TTcwTlExa3FiTndVR2poU3kxYldibTNMKzd6Vnoz?=
 =?utf-8?B?cUZ6UGVCZ1FIb1FJSFQ2YndkVERIQWxHdnpZbmdyaSt0NDU5cWFOZ3BKRzFI?=
 =?utf-8?B?OHJRWElTVEhGYVBtNU9hZU5XUDVaWEl5K0U2UDhGd2JVam9sbEtrcjFqMGhY?=
 =?utf-8?B?RitlRnp4U2xKOS9ENUNoSlJrVUpWWTZCNDBHdUN2ZStBK2o2RHBLaUxwOUdK?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9d342f-6514-4feb-ea9b-08dd7ccd422f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 09:58:37.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mawb2FaRdmuA4P1T5XpNxtGl0m0oMtC28u/AJedGYz2lgHhZ3/PTkutolUmz5eOTCGAZbcN7p1O1i/bVgRObt2rYrtFef/B3ZjuBjmbqcOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8195
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Apr 2025 09:58:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6755

Hi Antonin,

On 4/16/25 9:46 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Mon Apr 14, 2025 at 2:18 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 4/9/25 11:55 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Introduce the DISTRO_LATEST_TAG macro, which should always point to the
>>> latest existing tag in the documentation, unlike DISTRO which may point
>>> to A.B.999 to represent the tip of a branch.
>>>
>>> This variable is needed to fix dead links in the documentation that
>>> currently use the DISTRO macro.
>>>
>>> Also, make DISTRO_REL_TAG use the DISTRO macro directly, to avoid
>>> repetition, and add a DISTRO_REL_LATEST_TAG macro that has the same role
>>> as DISTRO_LATEST_TAG but with "yocto-" prepended to it.
>>>
>>> In set_versions.py, run the "git describe --abbrev=0 --tags
>>> --match='yocto-*'" command to get the latest existing tag on the
>>> currently checked out commit. Fallback to ourversion in case we didn't
>>> find any.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/poky.yaml.in    | 11 ++++++++++-
>>>    documentation/set_versions.py | 16 +++++++++++++++-
>>>    2 files changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>>> index 836f11454..26c21e346 100644
>>> --- a/documentation/poky.yaml.in
>>> +++ b/documentation/poky.yaml.in
>>> @@ -2,13 +2,22 @@
>>>    # Macros used in the documentation
>>>    #
>>>    
>>> +# The DISTRO variable represents the current docs version. It should be used
>>> +# when referring to the current docs version. See also DISTRO_LATEST_TAG.
>>>    DISTRO : "5.1"
>>> +# The DISTRO_LATEST_TAG represents the latest tag on the current branch. It
>>> +# should be used in HTTP link referring to the current docs version. In these
>>> +# cases, the DISTRO may point to A.B.999 which does not exist (just used to
>>> +# represent the latest HEAD revision on the branch). DISTRO_LATEST_TAG should
>>> +# always point to an existing tag.
>>
>> I don't remember why/where we need A.B.999? I assume most shouldn't
>> point at .999, ever?
> 
> The default landing page of docs.yoctoproject.org is a 999 version (tip of the
> stable release branch).
> 

That essentially should be for the version number in text and in the JS 
dropdown? We should really check our use of &DISTRO; in the docs.

For example:

documentation/contributor-guide/report-defect.rst, not sure we don't 
want to use &DISTRO_LATEST_TAG; (or another variable) instead, as it'll 
always be wrong on the default landing page of the docs (always x.x.999)?

documentation/dev-manual/multiconfig.rst, I assume we also do not want 
to have x.x.999 there? I'm also not entirely sure why we explicitly list 
the version or if it's still appropriate?

documentation/dev-manual/start.rst:774 we should probably get rid of 
&DISTRO; (but we can keep &DISTRO_NAME; as that matches the code block 
under?)

documentation/dev-manual/start.rst:843 is plain wrong as the tag does 
not exist so we should be using DISTRO_LATEST_TAG. Same for
documentation/dev-manual/start.rst:854, same for 
documentation/overview-manual/development-environment.rst:459.

documentation/ref-manual/release-process.rst:15 should probably use 
DISTRO_NAME or DISTRO_LATEST_TAG? (or probably another variable which is 
only X.Y and not X.Y.Z if there's one, since X.Y.Z is a minor release).

documentation/ref-manual/release-process.rst:59 probably should be using 
DISTRO_LATEST_TAG too?

documentation/ref-manual/system-requirements.rst:58, could be using 
DISTRO_LATEST_TAG but probably not a big deal if we keep DISTRO instead?

documentation/ref-manual/system-requirements.rst:349, I woudl assume is 
completely wrong and should be DISTRO_LATEST_TAG instead? Same for 
documentation/ref-manual/system-requirements.rst:350?

documentation/ref-manual/system-requirements.rst:403,407,411,474,478,482 
need to use DISTRO_LATEST_TAG to match the name of the buildtools.

documentation/sdk-manual/appendix-obtain.rst:66,72,176 needs to match 
the toolchain you can download, so needs to be DISTRO_LATEST_TAG.

documentation/sdk-manual/appendix-obtain.rst:275 probably wants 
DISTRO_LATEST_TAG too.

documentation/sdk-manual/extensible.rst:120,124,126 probably wants 
DISTRO_LATEST_TAG too.

documentation/sdk-manual/using.rst:74,78,80,101,102,104,105,110,130,141, 
probably wants DISTRO_LATEST_TAG too.

documentation/sdk-manual/working-projects.rst:85,88,219,223,225,280 
probably wants DISTRO_LATEST_TAG too.

documentation/toaster-manual/reference.rst:161,295 DISTRO_LATEST_TAG

Nothing uses YOCTO_RELEASE_DL_URL, maybe we can remove it entirely?

>> Also, it would be nice to provide an example as to what is supposed to
>> be stored in each variable based on a specific example.
>>
>> e.g.
>>
>> """
>> # If building from master, e.g. commit
>> 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
>> # DISTRO will be 5.2.999
>> # DISTRO_LATEST_TAG will be 5.1
>> #
>> # If building from a release branch, e.g. styhead (e.g. commit
>> 85e738e4c0e62f69699fff4bb0482ee3e3121496)
>> # DISTRO will be 5.1.999
>> # DISTRO_LATEST_TAG will be 5.1.4
>> #
>> # If building from a tag, e.g. yocto-5.1.4
>> # DISTRO will be 5.1.4
>> # DISTRO_LATEST_TAG will be 5.1.4
>> """
>>
>> Note that I haven't thoroughly checked the above is correct.
> 
> That's it. Although, as you see from set_versions.py, these variables are not to
> be set manually in poky.yaml.in, and are automatically set by the script.
> I could add a comment on that in poky.yaml.in.
> 

It's actually been bothering me a lot that we have some parts of 
poky.yaml.in that are taken verbatim and some modified before making it 
to poky.yaml.

I seem to recall we wanted the variables set by set_versions.py to still 
be able to build the docs from tarballs and not force the use of git 
repos? But it seems like we force to fetch git tags at the very 
beginning of the Python script.

So I'm wondering if we should only have variables that aren't replaced 
in poky.yaml.in and eventually have the ones set_versions.py adds in 
poky.yaml (instead of replacing for example) documented in comments to 
explain what they are and in which context(s) to use them?

>> If that is correct, do we really want to return 5.1 for LATEST_TAG if
>> building from master?
> 
> DISTRO_LATEST_TAG is used in URLs and in most cases point to
> downloads.yoctoproject.org. Now I'm not sure for master we want to point to a
> dead link, or the latest tag across all possible branches, or just the previous
> tag on the master branch. For simplicity I'd favor the last option, especially
> because master is a dev branch so we don't expect any sort of stable information
> on there.
> 

And the dev/ branch isn't the one accessed by default when going to 
docs.yoctoproject.org/ so I think we can afford not linking to the 
latest tag in the latest release branch and instead the latest tag in 
the master branch (i.e. the last release's first tag).

[...]

Cheers,
Quentin

