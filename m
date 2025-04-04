Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CD1C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:34:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web10.1565.1743784437610241563
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 09:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cdIMvrW4;
 spf=pass (domain: cherry.de, ip: 40.107.20.81, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMbQBaTzqXnZ1uIHlOIGlZnGbQYkZSgAY0rRS0T5kxcRuET4c3Wzdgcr3rNR7N/wmTRVa6pLW0T8sRq7dAKO3H0z9IATX7XlCY8+Rrgv+hhq0ko3R81n9N9wPIz0NrsH+wvm/q2/ucKe76uH4SYBjVfmCzCR/aHZUIbt3S7d+tmrzVgBu3n9sN84YSfQcKQ+1gBEDkozxELACH4iIzDU6svRE5m/b4XlJ15/9LYvr+eA7eZoDGNIFkyHpZo80JZbmC0igLzAHLKY02xoiENx/hKiYGdyPsrmvmg/bQn0iOaUZbR4ne9k2pO3EyzL2brL55szVXEXdrbOjQj9tARl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPrU2lh/bCCi+j0kSOkdrIF/BonT7/DypTqzY63an6g=;
 b=wAzC+VF9WBLgS83H7apd6RG8tRuMtIJEzHYVILa0rgxl8ucd3gQ0q4zTR4pdpuMt9TJaB2eJh3E9S+aJoTa5b4WFVIzLuI7mciZuMP8KQvfgxgXrfkLO9gLeiEqywTjAcAt4E0SdniEqFMFDOLQNgk/OMfC2dwXUb23o3QX+U4hYYDUB6OlUeUWnIyw7sMSozdd8GQr2c3vdJwzrpb+Xs22FO7vgGk3k/DxOJ+gyxGYUeN/AHJi5tXmMI18oZArC8F9ochRBWi5rLy1Bk78fhyaAv5iarq0ngolu1/l/JaFjG33Wot4LkBq+tiXhwv9bv1yfLUE0pmPFpaiN+rEHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPrU2lh/bCCi+j0kSOkdrIF/BonT7/DypTqzY63an6g=;
 b=cdIMvrW4MyF8DxbWNgaKoI+KMXJfduOjpP4T8QxYeFQIEZHT4G8xeSr0lhEkIEBIuKFXJOHx3Nt9W20Ix+v/1gNP8kSn70AuYKTFAvcOchnQcYcmy/qVFRgd30UQUmmwC1KOjgIPd5vsg6UVOfldybeylu99Nz4OcZa0UaGynh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8941.eurprd04.prod.outlook.com (2603:10a6:102:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 16:33:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 16:33:54 +0000
Message-ID: <cd9d1d8c-eb50-42b0-a428-f8065f80c323@cherry.de>
Date: Fri, 4 Apr 2025 18:33:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] migration-guides/{migration,release-note}-5.2:
 improvements and fixes
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
 <20250403-release-note-5-2-updates-fixes-v1-2-13d16361f17c@bootlin.com>
 <874b31e6-63df-4d13-b967-3014e6ea8ffb@cherry.de>
 <D8X3LOMBN1NV.TBIZ0Z7H4CCQ@bootlin.com>
 <ecd14134-aaa8-4492-93d5-62b24347d816@cherry.de>
 <D8XR2LY2SEAP.X21J5IT0X61X@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D8XR2LY2SEAP.X21J5IT0X61X@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 00242ee5-838e-4e6a-01f4-08dd73967d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVNFVjJvVmxQb3o0Wk1TMjN1UCtkZWVqOVhmVkR5WlNNeElOdjNCdGtHRE5R?=
 =?utf-8?B?ekk3VVZaZ0MvZ1hZYjIwQjFBOW9jQXcwZ2JjeXV2QzhpSVAwNDBONXIyREV5?=
 =?utf-8?B?dSsvbENCUkhPZkJ6eEg3MENJczJkeHkySzNrQVRXdUViL1p4bWJqQmNFOE03?=
 =?utf-8?B?dys0aDV4T0hPTE9wd2VTYXJESDcwZEJ2WXduMU1nUzZlOENNcUMrbm9WTU92?=
 =?utf-8?B?bW44SHZGL3UyZHJ6U2pPRnc5VHFRV0hIc1NFdGdaTmNJQ1J6Tnh0UXNhcDBJ?=
 =?utf-8?B?M1haQ0l5My9KSnZuRmRuNFZUYk5QdXA2MFYxZjMyOFo4UGFCRUlYam9GTGgw?=
 =?utf-8?B?cXVFMjcveFdHdlNWMVl1WmRLWS9VNnlySjc3bVB0NzVLZWE3TVNMaHZlUXpy?=
 =?utf-8?B?QjV3Ry9NQzMyL3Q0c1YrOXc5dlZTVG84dXM5WFIxZWwvbmpKekNxeVpPQW9y?=
 =?utf-8?B?VHJhdkNpQ2Y5dmpsUTB4MjJ5dmRjZ2dIVU9IcjB3b1N4bEFWZWxwYS9lcURo?=
 =?utf-8?B?a0FFcVJRRHdQZUxzeGxkRU9iRFQ3WHNkNXpidVltSDFpM1d4N2pwTHdKd0pS?=
 =?utf-8?B?TnEwWnJuQm5YbFVwbXoxbnBVVTRBa3dQeHlEYUh5eENIN2RUajZKOWVBdzE3?=
 =?utf-8?B?ZmdDT0ozUDN1N1B1Wkw0S2IvbkZFVlY2Z3dwTjBoMGJOVmYxM1Jwcm9QQmIz?=
 =?utf-8?B?UkdTYktqMElBTk4weFUraTYvZUtGSjBKY0paNFJ0ZmU1NSs5MC9Mc2pHUml3?=
 =?utf-8?B?RUlSODZ0N3VwZTNKZVcvTy9JMks2VjRRQlUwMGc2VGYzcTVtODFVL3FIWXA0?=
 =?utf-8?B?bXZTRms3VzhhOFFOelFJWkt5dHkyZzg1V0VJN3EybXBNNjNvcGhWSE5GWE8z?=
 =?utf-8?B?Z2Q5MGUzVTlVVDVvaGkzcElvN0wrY0Vkems1TjdYZHBZOHZuRng2c2FhUDJZ?=
 =?utf-8?B?QnlQSkxMR1ZnNHhOQzFQU1pXK1BUVE96YVJQWmlFc3krMHRtSCt3KzlPRGwy?=
 =?utf-8?B?RXhCNWk4dWw3dEh2YVdWVWFRek9uK0hOU2lnZXhLMXBJa0ppTzByUnVYNkJl?=
 =?utf-8?B?UzZmUWtUN2xwcXVnNERaTENZZC9BU0wyNG5tSGVTT1dsdnhRWUVYV2VBMzN2?=
 =?utf-8?B?SEFIa212Ni9KQm1rU0VyMDhXYTV4c2RKNi9XNmJpUko2NWo2UE1rNnJVQXNK?=
 =?utf-8?B?bEJGY0dIdDJLR3ZkblhkZkQ1Y2pyaXFQbG5JemxLTlBtc1Y2MlR2ZUxsY3ZX?=
 =?utf-8?B?Ui9lVmtUZ3BQL1hXdDlCZXA2TXBlM0JBWlBIT0xOVHhXdndqTkZiSHI2bjZH?=
 =?utf-8?B?Z2kxdUZMY3c1ditYSys1dGdERWUzR3ZVdnVxY0VPN203NVVlNW9Db3dkUGtE?=
 =?utf-8?B?UWFScWdIRmZUMjdSaC9Qbm9tOXVjZFNUVTlhaTNtZnFLVGZCTlQvQUs5TEJo?=
 =?utf-8?B?NjBIZWlTdzNacWUva1AwK05Sa1cxdDFNVkJlOEpBRFJtZEI2aldOcE1EaE9O?=
 =?utf-8?B?bDVLSmpTdlN6MXliTFdZdW4xMGR3RGtwTDRtNzBwRUgrclpSU3ZXTElqaUJv?=
 =?utf-8?B?WXduR2kvUXlpR1lLanBFdUFoQTVSU1R0M2kxT25uR21XMmJJcFN6SGYyQjBJ?=
 =?utf-8?B?TU1LN2owdzREZWtObndSTzI3SEhiMERjb0RtYTZySGxZc3FGTEdqeDBXUys0?=
 =?utf-8?B?TVlSd2taWFVyam9LaWtaVmVmcHEyamxPQlErdW11U1ZaRHE1aGJibnQ4bG1F?=
 =?utf-8?B?U1NlaVBuNVJGd2xkUEk5SWJyS2gwY0RtOVJzMXppR1lqamRGWFl5YXBHOHBh?=
 =?utf-8?B?NnpFNXZaWEQ1L3JUY284dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFhKb1ZJZGVibWhTSXFwZnVUOGY5eHFLR3A0MXBEY2xoTlJ4c01iRTB4MnR0?=
 =?utf-8?B?OFVYTE1FVlc3RUtZNm04d25pK0hPbkd1eHdma2FFNEpvYjBCQTF1OHFEOXk2?=
 =?utf-8?B?dnhJMXJlWjR1RThKN0J4T1NaT1BSYkI4cXM3dG9tZytuVjRYNVpWL25SbXhL?=
 =?utf-8?B?enh2STUzay9HRHBBcm9QTS90ZkkwRDZyMGZibTlQQTZybENORXk1VmxpOW9I?=
 =?utf-8?B?Nk1rU2lXTm5CNGJ3cTFlbVo4aklId3JtQjd0RTg0cGZWbjdRWWdRcmtkVnJX?=
 =?utf-8?B?RjRBRFdIdnFxYjl1K25xTThyTFlUWHAxVUthVUZUK3UvRXVsSUxQYW9HLy94?=
 =?utf-8?B?THlZS0Q1Y3UyNi9yRllRL25sUXhPeVo5VDkrQzF3MHhsMU9WRUpQNVFQOU1O?=
 =?utf-8?B?ZFJPMXNtNjFWdXZ1ZnZtNE9SNHJnWk9MUDRJcWlDSnpHZ3NaVndwK05lYzQ3?=
 =?utf-8?B?Skgxa254RCtCNDIrd1oxeldic3dLYk5oaXNPL0tHWm13MjYvZmtpWWJROTdV?=
 =?utf-8?B?bGx1aXZ3VHpFWUlXbUtITFYyVmQxWm5oZk9GeG5GM3REdlN5TkhtY3RHbVNI?=
 =?utf-8?B?WTdBSjFSR0NPRWpvQVFvUFF2ZFNKVWN4VGl0MW9teElUdXBhRkNHV0NhWEV3?=
 =?utf-8?B?dFQxZVVVOGVXTVVHYkFER0pFUjdKY0pqR0ZVVjdpUE5QR0lpZ0ovNzFqMnla?=
 =?utf-8?B?b0ZoWUNueDRLZmtMU2k4ZlZWeDZUQ0ZtWTBuS0JFRVlTOHJTbTdoVndqenRk?=
 =?utf-8?B?OXM1WlY4bDVJeTE5TWxLMERsMTBHL3pORUlWQTFCVVdVaXF6UnBsZkx2TUV1?=
 =?utf-8?B?Q0YzU0IxSldBdFV1dE5CSlNQVkI0TjduOE5JclVIWnd6dER6ak9oNk5seEhW?=
 =?utf-8?B?ckpSQTRHUitLYUVOZlFuOW4waktvQlpEZzZEMGthcXh6a2VwdG96dSt5akJM?=
 =?utf-8?B?d0NjUnVySXU5QloyQ1RyMUZzQVR0M0NEbVg4eG9ZVzAzQjM3UTk3cVNZTTRq?=
 =?utf-8?B?Q290V09idWZEZ0ZpUFNoL1RDWEo4dzlUa1loZFZpcU5USHdnVkNTdklhemt5?=
 =?utf-8?B?VkxkOW9JWWZ2em9WWWZqRlVCT3JaVnJyNTBCVmFzNTNSQW9RN2x5eERRdkZy?=
 =?utf-8?B?SGhwK25sRll3bDNCK0MzK2dEMkpETmQ1Mk00bmEwK1dleDF3T0RiZ0tXUkNk?=
 =?utf-8?B?cEtPUE5Mb2Y2TEpraTJMcFQ4dDUwT2J0M3FrYjZua2I4M203VzNpNjhFVlF5?=
 =?utf-8?B?K2UrTHRqUWVFcC9WUVFvZGJhVFNOUlYwejQvTFlleU8zWE1wZG5Ja3pEWW5u?=
 =?utf-8?B?NEFsdGk4alZTZU1jR3Y2YlhSR1l3dTIrUVNNRnFjVkYrN1MzQ3pSdGY3cTVp?=
 =?utf-8?B?NHBxSG14VUwyY0h5a2p2VFJwSitaV3dXTERxSEFUcDJTZzRxN243am5FQ2Nq?=
 =?utf-8?B?Mm1SVkFCRGsyUmdwOWhydEZiMjJTSEVmV0kxMGlyNFdhNTVNYlg2Z2NTQWpO?=
 =?utf-8?B?WE9yV28vNU5WZ2NyY01wK2IxbzNNRytOWHN5TXAyMDZRaDlMR0h1NGEyL1oz?=
 =?utf-8?B?SHJtdzJXaEhBdldmbmkvYVR5ZmJMdTN6dUM3cWRwYkdrUGNBOGt1K0J3L2VN?=
 =?utf-8?B?REIxa21veUN0OFlFaElaOEtLRE14RGxGa3FFVzc2c1ptY01jM0hnT0tLbVJy?=
 =?utf-8?B?dzhXR3FPY1NqNzlhbG5yUHVDQWljc3dxRVpyOG5wWXVpS28rNE01VXA2L1c0?=
 =?utf-8?B?elBteGpJajNvQ0F6anVZanhTN0ZxcDYybzdYT0JpSHZDbWlobkxrdDFJdFZq?=
 =?utf-8?B?b3VSNE5BcUd2SmJEV01jY3NLZFVGT1EzMS93SGw1OWJmcVM3NTZFZ24wck1V?=
 =?utf-8?B?NWRmU2ZNM2YrSmI0a21GWWQ3WFNIS3pLdTFTeGp6cWRoT0diczBubXFhakha?=
 =?utf-8?B?YjVZQUtkd1JZMUlKbzVFMk1PYktpUGh6UjFSKzNxbjEvUlNrZWlWVyszOE96?=
 =?utf-8?B?SnhVdVRVR1o3VVZxTThLS3NMdDBhWVo4elV2cmNqMnpnQ3hSMkQ4M3B6WkRG?=
 =?utf-8?B?bnpuMFRPUmtCRUhTdGMzMWhqRmlJRnBZUDUvaFpJcFRFZ1JYRTlyU3FCaUtX?=
 =?utf-8?B?R2pHcitPUktQOUlVQTdlQVp3am0yTENYQ09iQmtZVFZ0d1FwWnZTc1dDa0ZW?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 00242ee5-838e-4e6a-01f4-08dd73967d1b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 16:33:53.9386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ls9J2nryLi8yXu+8Rf8Ye6xigyC9woU4ysL8jDkixYcJvds37c3LIG67kMB8LCnsAB41tSYUniVmjIrv2JJOI4fukrUIQr+wQNIVL3T0m6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8941
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Apr 2025 16:34:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6714

Hi Antonin,

On 4/4/25 11:34 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Thu Apr 3, 2025 at 7:37 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 4/3/25 5:10 PM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Thu Apr 3, 2025 at 4:23 PM CEST, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 4/3/25 4:08 PM, Antonin Godard wrote:
>>>>> Address some of the reviews received on the release notes and migration
>>>>> guide for 5.2:
>>>>>
>>>>> - Remove the wget fetcher addition, I misread commit 0a9f90ff658e
>>>>>      ("tests/fetch: support setting PV in the wget fetcher") from BitBake,
>>>>>      and it actually affects the tests for the wget fetcher, not the
>>>>>      fetcher itself.
>>>>> - Add a way to transition from the branch=nameX,nameY syntax. From what
>>>>>      I have tested, I achieve the same behavior when using one or the other
>>>>>      syntax.
>>>>> - Remove the default value for SPDX_PACKAGE_VERSION in the release note.
>>>>> - Fix a couple of typos.
>>>>>
>>>>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>>> ---
>>>>>     documentation/migration-guides/migration-5.2.rst     | 10 +++++++++-
>>>>>     documentation/migration-guides/release-notes-5.2.rst |  7 ++-----
>>>>>     2 files changed, 11 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
>>>>> index c54f054c7..59f21ff4c 100644
>>>>> --- a/documentation/migration-guides/migration-5.2.rst
>>>>> +++ b/documentation/migration-guides/migration-5.2.rst
>>>>> @@ -193,6 +193,14 @@ anymore::
>>>>>     This was rarely used in the core repositories, and this removal simplifies the
>>>>>     code logic in several places.
>>>>>     
>>>>> +If one of your recipes is still using this mechanism, you can split the
>>>>> +code source fetching into two separate entries::
>>>>> +
>>>>> +   SRC_URI = "git://some.host/somepath;branch=branchX;name=nameX \
>>>>> +              git://some.host/somepath;branch=branchY;name=nameY"
>>>>> +   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
>>>>> +   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
>>>>> +
>>
>> Just to make sure we don't miss this for the v2, but this "solution" was
>> rejected by Richard as non-working, see
>> https://lore.kernel.org/yocto-docs/9c3af54f0c74af0b9d0887e0408fd591e936c4da.camel@linuxfoundation.org/T/#u
> 
> Hm, but there are recipes using this in oe-core like [1]. Does that mean that
> these are broken at the moment?
> 
> In my testing, I could properly fetch and unpack such recipes with one syntax or
> the other. Indeed, after unpacking, only the source code of the first item of
> SRC_URI is unpacked and present in the WORKDIR, yet BitBake does not complain
> about the second one or produce any kind of error. So I'm not sure of what to
> conclude on this?
> 

I think what Richard meant was that it's brittle/finicky/unstable to use 
twice the same git repo in SRC_URI but with a different branch/srcrev?

And that it's believed nobody did need that behavior (only the kernel 
recipe was using that in OE-Core, ever).

> I'm not sure what is the best to say in the release notes.
> 

I guess he suggests to simply not document how to fix it because it's 
"incorrect" (my understanding of what he said) and virtually nobody was 
impacted.

Cheers,
Quentin

