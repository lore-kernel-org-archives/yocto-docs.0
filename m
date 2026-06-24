Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66044CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:28:50 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3213.1782293323009238646
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 02:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DtOnRYxx;
 spf=pass (domain: cherry.de, ip: 52.101.72.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b15iWNuelldeqjEl6YLTSRTQ5+YYAyakGf8+iDvIzkvz2eSK1DiyDIL1R9JFR4qwSZ7znE1Uhig9QNFo75zpquxIYR33LeHE1Psl3SKe3mvwXPLodnclfdeRFD4/zPvb7MKniQid/a9qan6y400pvFhqdQ/7dmsb4HdINiPZH0bXLoq+jJW1L+pD/h7xZewwotbG5lmI8iU1N83o2mR/ISNXoG/FozopytuFp4aHSTMWkYw0mYDImU15ccA+oZ/peuS3aiY4PyuE/vYk2o1pjnhf5fswaPt8s0Xp6Pm83zZEMog/uIC/y1JLc6C355Ve0rf5390I55CHalPbiEBZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4noNYrFAsGR2YHpxj7oJcPopmntmLeTLVteJfyZJOFM=;
 b=zAjLmBu3rriynwk7HFjXIyDn7IZil21jy6WK4mMGBsf+ZsECW+6p53XlFf0tY9FtiaFInqQXVD+TlvegG45pl3plGBG8LlDNeVaP+21/ZJYj2ogFv4DsuudQYgibJNzp8OGOpedYHg/LnzdnXGQH9/35JIgcypZuJY4te8s+rv1CtwDwAP0TVOh5+Zt5aLaBOAtpOA9Vzea3QHid3gXYpvWu5UnKfxToT+FyavKilzJenhhDHb4tu4A2NY5UBzN8TjEkbVHjU6aSYtGvQt2CXJ+/v+dplPNqjdPRZcbs8pjNZ44X7nHAvxh43HWp4lLH078hx2Z49mMiv2DXe6JC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4noNYrFAsGR2YHpxj7oJcPopmntmLeTLVteJfyZJOFM=;
 b=DtOnRYxxnmBMRJF9l3BF4MWmsduOK86KVUgn9JkLcZOf1b1EUIP/X1j9oSj0/njxBLgtE6pCBmMxJOlFqixXNmnrHIMJ8YOFcf3cUnQWD3zesP49/zuxh3quhRBQTSYkpAjdpUpXi5tKfX08A1pbWJQ6TsLfiWMQSUemT2RV4kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB6935.eurprd04.prod.outlook.com (2603:10a6:20b:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:28:38 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:28:38 +0000
Message-ID: <cfc70f67-3220-4766-ae57-035f66eb56eb@cherry.de>
Date: Wed, 24 Jun 2026 11:28:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why not rename "Maintaining Build Output Quality" to
 "buildhistory"?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <4871863c-1d5d-1ff9-2918-a2d9c6e19041@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4871863c-1d5d-1ff9-2918-a2d9c6e19041@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2PEPF000008A2.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::658) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfb8a91-3cc2-4a59-f3b5-08ded1d2f890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|18002099003|22082099003|3023799007|4133799003;
X-Microsoft-Antispam-Message-Info: 
	Hqka2Mw2Hxr7Qk+7mA3zabYbV77djgpz2WQg67N3hEPsdCmhdD62195sQuAUt6A7+Id+w8OdpI5ckFRTFhN3JefszCyeraQWhw7cPsvyg7tEqFB9Gx1sHMkPg0WTnpeGJMc1QlHKGjxIvOVIPr2ox7ezZxR7iR88CRkJ3HMmT76KUmLYNIm3EKVbsyUcMI6SzuumrykeI6WoUd+8gAmR98vL6YXJDVqWAg6GXGPxHtGH+CUDlRG3++DBknwCfJhADQ0urgz1CXwA/4l8u9RM2OltxDN44tK2dTgleCMBdvYpO8wKPgq46nnyEP1LF9DrUP5CdF3PCKRG+oHG/uP3EvNxYFOqGqxBNhj6gz599RwaJlzi/KzzPSKt5uTsVZ/14jLxJP5cbQKJBAbCxqv79MYtd8ukgnic9RVtp/hypkmQZGI+Z5cEv+Vc1vtmdxKIUCWIeONiNghU5PALmRmJ4SJaQ8/NfM5q/9LzCsRtMwflZnQb3GVf5y/5tk/hVm8zw3o8F7dlBis17QKHwbEZ80kupWSiEdkQ3Bus7LYhYp4Keilgtt04rk5Ymwbs9WAuzCnjMpCWg/H/draxIbewO6jhikXbtVe4/hjq77LuSGakzSlTJ06IwKaSR3vp5/99emf63D0BPxtD5qjjv6pJtSp7ydEiPSHTtg+r2gh1+qg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjdFWktTWWdXZ2RRbFEyL21hREtUajBSRzlwdHZKMCt6QkdQajVUb3dqTG1p?=
 =?utf-8?B?b1lEYXl1QWlWenI2SlRoTHNzSjdHQXpEcFhPRWE4cWxkb1FHV1Z3UUd5a2wv?=
 =?utf-8?B?SHhCaUszdFlidXRWaU5YYWdqWStYU1V5aTc5VkJQZHV5Ynl6RFRMNzNzT0Zl?=
 =?utf-8?B?UDN6MWNTNHZpZVR5K1dwYnhvY1IwOW0xSHdaeFVFR3IxUDNpdXFZL3ZxdHZq?=
 =?utf-8?B?TVVkS1JMdEtRRUVJUjlndEJFRHNMZzRkclhkdXJtbmhkMXA1MzRjcUVLNHpj?=
 =?utf-8?B?SGpWTkc4czdZeVB1aHVYeldiR1B2SUZSY0J2VWl0UXlKMVMxVTRZZzNPZEY5?=
 =?utf-8?B?RVNxVVBaY3dhMGpHREFSU1RkMGxMMG8vcEJmS0lyUVRFTVRwVmlTRnF6dDhW?=
 =?utf-8?B?M0h0U1V5YWZVd1F6U3dsS3FLSmV0UTAzcDQvS2MwYmo0MUtNeDdWMXpIQVhQ?=
 =?utf-8?B?a0xMVFBrTU1TcURnTnBDTk1EQTBQR29ITDdGSFVsWWdOOVZrT2wzbTJNQzlr?=
 =?utf-8?B?M0lBUEtsOTduYVIrVGRyVUZSMWVwWm9nd0xDZkNXbHBiTXpQNVdMSUJVYVRy?=
 =?utf-8?B?QW9BdlBMTVo3Nmx2MWxkRUx1dU8rU2FkRUxEa0JLdDVGZ0VhVjBZY3BoQzlD?=
 =?utf-8?B?Z0w2UEwxbS8vT2RXRVRZZ0NDZWRRSWlvQkhrbFM5aitQUXR6TTFVZHp1T0Fj?=
 =?utf-8?B?cXcyWWVFT29OWjUzTStORmwrd0Q4VitJWW02ZVZlSUZOZGsxOFo1dlJGYitq?=
 =?utf-8?B?QUJmcG00QmQzaFcxd2F5ZDZEM0dvQXl2bXMxZGVTUmRELzFvR29hZ2M2MTBT?=
 =?utf-8?B?UjFHTEIxOTNBUXFQUGlJQ0lHRU4yZ2FBakIvRktNZTVsVk5xUHd0RWtIZ1ha?=
 =?utf-8?B?aEpvUGlEQTlwWUdwOVVSRVZzUDdSSE1sVTllNWRiQ2lFM1BpYklhcFFHNnJT?=
 =?utf-8?B?eHJ0VStiVUpHbENzOWVpajhISjdpTzdwTlYvU1BNVWVpc3hpTDN0REEvMmtX?=
 =?utf-8?B?UzkvSHlvYUlhcU5iU21KMlJlV0FnM1J2Tis5NDZlRmFmb1A0clp3S2lPRnhT?=
 =?utf-8?B?R0lQQU5zY3VIUmNZUmltdkRla2l2Q0VUTURwc3lzaFpuYUwwMVM4aVQ2SC85?=
 =?utf-8?B?c0xlcVYzYzIxU1dRVTVMd2tVbGYraUE3aDJEOEdmOU5BMFhkUWtORFJDVFFZ?=
 =?utf-8?B?NS9YTTc4N2lrOWZZcTdIM2M3K1JXR3ZtVERPcTJhc1FlME1Pd2RXU2tweVlh?=
 =?utf-8?B?MFE1Ty9BaXVaUlBMc3pwMDYyYktlSDFyZTQ5NU1YeVlYdVd3Q1A0Uzc2NWNQ?=
 =?utf-8?B?NTFoTjJZd3BzaG5wZGk0OCtoekpZNU96SC9VUFN1S2pKbWRHNnlveVRFUGtv?=
 =?utf-8?B?c1Zqc3c1NTRUK1BpSWQwelkzZHZVL1U0SnhrMi90M2VXd1ZqdjZxYlZBMTZm?=
 =?utf-8?B?aDhFeVFwZU9hcDlOZ0VobjY1QUlTMVo0ZGNKY0ZZOWd3SE16dE5YUzdFZW5q?=
 =?utf-8?B?c1p5RUUrZEFYVmYzWjhsK1JLVFJjL1FUYnVpeGNnVnNEdEtDUGlXMXBHcjZY?=
 =?utf-8?B?UEVvYVdkNWRvQ2x3Ry9QcklUZU96REx5VGs5c1ZzRjdPUXBjMzJMR2toZW5s?=
 =?utf-8?B?ZVZFanM2aGFJSWxkdThoWkxMbHd1UHhWS0RxNzEvanc5YmpDbnZRbHZvWUhO?=
 =?utf-8?B?eld3azVLWlU0VTZ6V05pdmRVeVYxM3JjZGxmdUNscW10andtVlJ2YzZHVXFq?=
 =?utf-8?B?MXY1c3VybXZacS9SSTI5Z1IzVmh6S1JvMER4OWxhZFRpM011SkhJUG9IN1lj?=
 =?utf-8?B?SnVPbUdLYjZ2V216d2lNK0R1TzdzRXcxbDhQL3dLdnRyV2VrZ2NIaks2dXo2?=
 =?utf-8?B?WjRycWxPQk5mOStOWVFmOFJwUkRjM05aMGdLejJpS2hJNFprejl4K3BJTkRk?=
 =?utf-8?B?T1RZMWg3WTRlOTFhVWNEeEV5My9aanlUVndjdWJXbEF1RkFKU0NYbHZHbDJo?=
 =?utf-8?B?MHlsdG45eitacjZKR2hjTWdUN1BodlJYclB2WGdLTG1CWjk0eWxJeHkycmhH?=
 =?utf-8?B?N0l5N1JuSzR1aU5XV0JlM3I2dGJ4bmhFeFZyTnB3ZmMwRldjWTIxNi94VmpQ?=
 =?utf-8?B?ZEZaYkd6STZWY0pUSkhrb3ZNTlM0OERJaHFndWE1Ny85M3YrRUtQQjl3aUJ1?=
 =?utf-8?B?enhIcDEralhvcTRlazgxc3hBRDJNVS9wZWpKVE1hWGZES1F1bUVkVFozQUY3?=
 =?utf-8?B?VG9rSGZEd3ZoY0laNEE2WEVybEgwNVBwRGVKN1JyaFJEN09hZXpTUlZPVnVG?=
 =?utf-8?B?a3VtM2JhcmU3dXU1bkNVQVJ2b0ZzckhaWmJsWEtiSEZ3VjFuZllWZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfb8a91-3cc2-4a59-f3b5-08ded1d2f890
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:28:38.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi4zaW0DQjEeqNfYm4uE/g4d+mFEd3KE2qdVLvwUccdNNbw2qYdBLBqSxCm1vsRW9wpsVF0ISY/K1QK+u4N6EAKqaXl98wYrho7wVL3knEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6935
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 09:28:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9851

On 6/24/26 10:21 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> while this section is titled "Maintaining Build Output Quality":
> 
>    https://docs.yoctoproject.org/dev-manual/build-quality.html
> 
> it's really solely about how to use "buildhistory", so why not just
> call it something like "How to use YP buildhistory"? the title seems a

OK but why would I want to use buildhistory? How do I hear about 
buildhistory in the first place?

> bit misleading and even a little inaccurate.
> 

What's misleading or inaccurate about it?

"""
The buildhistory class helps you maintain the quality of your build output.
"""

This matches the title of the section (which appears in the navigation 
panel on the left.

