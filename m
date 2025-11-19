Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A3DCF31B4
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:13:16 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5500.1763554387051641338
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 04:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AIr6nZI+;
 spf=pass (domain: cherry.de, ip: 40.107.159.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHBh3x99XVnbTyvcz5mzsC7svlkX4dT/q4fgZzT/biRS2YevobmSAo3EU/yYYvdEtRiBH9y/n+qcP/eWyYWg5BGoSzrxbZRs9uFyJOb8DmCPQqDqSPBHSfQ+XDZLbua70pO1W6haW/rwdgkLG+EIKLpWHiSKGujlaJdo8t22cfQDu6pnMLk0hd19Dc8Vxs1rpp23TezOqKSwmWULITYGZsYnFw8cB+af4XhyWMDa4lrClRWYmhpEIlSFnK50JUdPCbcnomuWsQK/EApCrW3rny77EJ+7OUuQYUwJL7UsfbUGnn4sfvo3V5g3un2s+5xCqT5eZbgo6OPUDUegBDKl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDoRpI2ZhbvuyvPeYPM9/TQBVJsxIBF5Qsz8CYiCUp4=;
 b=OGHSddRpReYS3KInEkOACsuN7FCB28nguDK5Gt8yHa1kmvtXcf5BdkwRhTGnebQx3EQAbbGbsLQeLi091EaVAIL1hop8MnSZDTwU7hD87xNe5Mpn1bqWHcxv8aCJlM968GCCktufzc+scBh5KZWBGs/KponyUP6Ha2DSExV8d5OKGcYtKrM7UOfWyOWKzPgovJk/QYN82gkZt6OTVEyA4HnlqglcMCpbSnckb5lALeoKSfhPFbjh+/Z5gA/JC++BK9uX39uTcHLOBllv0c3/MPiM23pFRV0QKsQhnJ7lp94bNKc8ALomeL06ls2YiLRpLk/NaP/MWgclCHLbl+S/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDoRpI2ZhbvuyvPeYPM9/TQBVJsxIBF5Qsz8CYiCUp4=;
 b=AIr6nZI+dURyUdw8tKp7WS1UnbiaKW51wkzU1iFokMGKjm7SIIb/v8Dnbi5IP1Yq4dB3XZAGZRaR8cnOHxQTqiLVP9K1WtKs7di2DdhwiKV96cYwJhm8m6G5uasanQ2Xo6C4njNqVKc6EZJS37hNYIXefZ39frmpeODiVtOpjQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AMDPR04MB11299.eurprd04.prod.outlook.com (2603:10a6:20b:6cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 12:12:57 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:12:57 +0000
Message-ID: <6b46cd9b-8e24-4edd-9051-c9c0f03617e8@cherry.de>
Date: Wed, 19 Nov 2025 13:12:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] can the assumption of building on ubuntu be relaxed to
 debian?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <24bb11b9-85c3-9dc8-e655-b630dbbcbe9d@crashcourse.ca>
 <318bddb4-bd28-4be5-87bb-4262076bd495@cherry.de>
 <3ae9ad48-13bf-1afc-6ccc-3bff1fddc8a1@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3ae9ad48-13bf-1afc-6ccc-3bff1fddc8a1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0414.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AMDPR04MB11299:EE_
X-MS-Office365-Filtering-Correlation-Id: c7cf516f-b631-4c49-415b-08de2764f99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bjBjdW15Z05uNnlLbkl6UlZlSEZ6cXRWSzlXMFJhK3ZGOHdNdDNzbzNCcVI2?=
 =?utf-8?B?bmFkY0ZKNW5UMTlXSW9QcFFBUTZyWXoxcW83SWNPOU1KTVRmK05wSXhVWHBK?=
 =?utf-8?B?TlhjUmFNM05SOTFCUU9OMCtLTDVxckd4ZVgrQ1hrYjhvaFRhMG42UWpUMDY2?=
 =?utf-8?B?RTRyZTRyZDFibndPZUlKR2kyNzIvREliNm1lNkxlOWpmSGpMMUpWQ20yVGR2?=
 =?utf-8?B?d3krVGZLV0FlaXUvK0l1bUZiYklSN2tsYTZCc0E2T0p4RlI5dGZTZjF3Ymc4?=
 =?utf-8?B?L3paMHJjak53YmY1TENRUDJUeUM0RXF2eFBUVE1INU81bGUzNVRxMXhTMWFT?=
 =?utf-8?B?SDdtMHJUYlRZdEpzYkcvY2E0WTZ3MStuN1lZSnJaWUkvYU9HT1YxT2dkOHcx?=
 =?utf-8?B?TWdWdkNFcmRnVG82OUJHdHRoenIzTDVPZCtBR1ZUVU9WSEtDZTlZT2hraWRY?=
 =?utf-8?B?WVRWbmZyM3l5MkFjVDE4SW9uU3MwRUF1ck9HY0lSaXdJTUVOc2pTTWVHejlG?=
 =?utf-8?B?UnN2OVFBcjZKcXBjK1prOTlpVjhacTgzVjM5RWQvRlJjWUJYa0lUd0lNdFNM?=
 =?utf-8?B?Um11YnZiT0ZKRzUzeUR5M0F1R1lWUkZjWDFBRCthL1o5dmZYc2hTOUtQSzJV?=
 =?utf-8?B?ZDQ2OEdBa0dhd04xN0xHbDBqOTl4ckJZZGRaLzFmUEhldC93Q1MydUlqbThH?=
 =?utf-8?B?UFBucjd2K29pVzQ1Z2NYcUVrUGhPLzMvd0hnUGxUb0pVMTA2SlZhTUV0Wi80?=
 =?utf-8?B?c2pxbENxcUJBT1lWdXJPbzkzUElGUWNHbGZkWUNQbEJ3czgxWVFvT0JuTUR5?=
 =?utf-8?B?T3B0TEcwODdKeWV1VEhUaitzSE5zc3hKVXZOMTJLQ2xOMEVnRGZWUk1tY3o5?=
 =?utf-8?B?UUhzYlRadGpVS3p1bVk1OHVqaVRzRDhNM0ttREc2RXdIK1p2UytiZlN2S0JC?=
 =?utf-8?B?RmdQMWF5bnlhWGVqTldjaHNwVlI5Tms1RTNwUmNpQTlLQU1mT2N1VVRtODBl?=
 =?utf-8?B?ZEFCTHcreS9vT015aHhIUTNrOTBLVURWenlmd0xUWmVSSG1GcUlpeDNGTFlP?=
 =?utf-8?B?Q2RYZW10N1VaREVobmZMT2tYNjExUlVhVDJOTW1ZdXNBYmZmeVdUVTVpYWt6?=
 =?utf-8?B?UjJQL1RncTV6MjJYWStHNHJLZ1c0ekhkZFJZUXc2MkxBRUNNN2RBMklHOVZX?=
 =?utf-8?B?UjJkeFFoY1Rab2MvTjJjelpzc1FxSXhveG54Y0FMMHl1dWlrTEwrMEJFU1Ft?=
 =?utf-8?B?aUpsMWp0QzlsWXlTb1JCWEZsdWNwaTN6MllOTnRaWjBTVnNoTWl2QTlZdnRx?=
 =?utf-8?B?RHp4VEY5bUVKR2JFQ0gwZi9HRVE3b3VjaHExUEdHVlFGQ2xWOXRCQXQ0MkFD?=
 =?utf-8?B?TGU5QjhVc1BWeENjd3dmdU5ydGVlL2NWQmJPMzk3L29kMnFYdmlKRE9DUDU2?=
 =?utf-8?B?OUR2UUtNT3htSGxQYktMdlY5YWU2d0RZWStVSk9McmNLYlc4eDlqZHhsUzRH?=
 =?utf-8?B?anR5K0ptMzkvQWduZnJ4V01UdHFKVlJ6eGtEcVh5aTlqYUdZNm5mZjZ6a2NI?=
 =?utf-8?B?RXJ5Yk51WktvUDFIbkduVlIrQ1I3R2hpQklSdnpBdzV5anczMElmQ3BDNmFz?=
 =?utf-8?B?WWRnZlpnVXVGem1laDI1SUFYQ2F3cmxsNWMyeVA2MmlMMndGejFYMnlKR1Rr?=
 =?utf-8?B?Yk9kMmJNQ3I3SkVpeDJtWnl3N3FDN014NWNHMENtWXpoMm5CRFBXS0FnNW1m?=
 =?utf-8?B?ZmppMEZHcStMcXV4TWtDUTFxazZyUVU1NG10aTBMS21BNnhCWUxaRjhHSGFa?=
 =?utf-8?B?ZGd4NytvbFpLMFlBYzlmZ05nTUlBOER6Zk1jaVBwSkdyME9FQlkxZE91a2gv?=
 =?utf-8?B?d0NFU1h3cXFIYU50RldyZFU4Rk15NlJ3UTc1eEJiR0lBTlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ekpueDk3eXZlWVV4cEkzSWpTS2p1VG1BNURtc0l5cjZWbVN4bkJOaWIyV3Rl?=
 =?utf-8?B?Q0ZRZVJYZS9MMzNmUVNNOGVSU01SSmxSVHpvTnhIWm1iTy9ScUY4K2pPNFJk?=
 =?utf-8?B?bVhTQUtPcnZkT0VjcUlRb2h2Vk82cWtBYzFwNUFpZTZ1Vlh6YmQ1ejlsMWov?=
 =?utf-8?B?eTRYTUlhdGpMTC9HeUx5bTd2MENORDdWQ3B6eWl3cVd2NERQbi9rZm1CODAr?=
 =?utf-8?B?em5lY0xRclU1UDVETU5XcFI0c0VuVzlzM2FwcEpvV3VOaUtWZWRUVVllTjFq?=
 =?utf-8?B?VDU1RVM0NUZLRm0vSDdodXRmeHhkeEswb0w4Sm8xSFpyMHIwcDEvckljWFcr?=
 =?utf-8?B?U0RzRG1sZnU5OXBISmQ4NlRCVlA3Kzh1ekJCU2VydDU1SDRibnY5Zng3VFB1?=
 =?utf-8?B?cTRHN2toaHl4NmJMVmQvb2VXVk45ZWVnQkx0aEE0b1N6bTJIMTZhdWxpUXhE?=
 =?utf-8?B?Z1p4VzE3SXNNL1F4bkVBUHo0bEx4Z1lZRWhRMXV0UnBHckpZa1NFS2tMK09Z?=
 =?utf-8?B?dXgrdklaaWt2WURqRGRXMG9jb2tkVzJFV0dLN2F4dWIvVnRoeFZpTG9rUjB4?=
 =?utf-8?B?M2M0NTYrVWVCVXFob0hUeHdhTW5GQTVuVkEvTnlldXhyQ0ZaNG9iRGZzVnRn?=
 =?utf-8?B?VEJsbmFMbWhnSk5lQWdpdkhVWHZrVUZ3c0Y5YURtNDlRME9IeFRCd2R4dFVI?=
 =?utf-8?B?c1lmNUNjdGxhbnRBRlFyenFpKzcyZkVYSzV6cUIwZ3hMUlpJb25xUFFvZHdB?=
 =?utf-8?B?U1FZeFpwblIzRVpHR2Z3aHRkZ1NFUEdJSWVLQ1MxQmRJWGhQaUFkT0xnbW9y?=
 =?utf-8?B?NmxrdXI5cDJBSzhlYVREN0YwWDBFd1BoUEhzZWlNOUNZNmJ2QkJIcysxQ1c4?=
 =?utf-8?B?QnN1V1NGdFJVd3FZeHJYK3lrZ1pGYmlrSkhSSFE0QmV5TDB1ZGlaeUJuT0cr?=
 =?utf-8?B?OU51elZETWRxV1VlT004Z0tGRnltOFlFcEpmNEJ0aURnL2kzZnNQcld6YVhu?=
 =?utf-8?B?RndnK3NrUWs3ZW51aHRzK2FZbTlkYTdqTjNSUkk5TThmUEN4ZEdvZFJWQUhv?=
 =?utf-8?B?bDBwKzVNR3crZVhCQnVheG5IQ3dJbjlHa0VpdnJBTEdHdGFveWxuSWVPR3kx?=
 =?utf-8?B?YzZManJiV241VXRnQkxsaGF1SjhQTU9yUWxPRE9MSW9UZ0U5NDkwNlRqcDIv?=
 =?utf-8?B?ZU10Z2xBRUJLSHJCTThaU0M0OG1MUmRORkpYWXFYQzQ3TGJXNTVuaXFDNHBa?=
 =?utf-8?B?cGs2VDZiK0taYmw1KzFPZ05teTdmQ0RrWldLMHVRaWRnQWhkd1p0bDFuTlVQ?=
 =?utf-8?B?SHN5eFd1cklpWFQ1Vi92Z3MreXVmSkxTWHlyTmlGV2hreGdOT3RCY1RxeExI?=
 =?utf-8?B?YS9NUWtGaUY1VmdFV2t1Uy9HLzNHMy9UOVFjaFZhU1pQUjc4VUN0TkhiMGE2?=
 =?utf-8?B?Q2Fpa3lBM0Q2NjlmaWMyVG4wdm5mZ1E1VjVBR1YzVFF0cVo1MmFMNTR0V290?=
 =?utf-8?B?VE51b1RtOGIvazZmRTB5amxObExXcWlxUys2UzhyZ3dvTWk1aUZNV2ZMdXkz?=
 =?utf-8?B?cjBxNFFKZ3ZpYjR1ZC9RY0JjUHpmS0ljVHMvR2l5cFAzVW9UcFg3WUxnWXRr?=
 =?utf-8?B?ZzFQYnVybi8wcnRuaVhFWW5aWFI0bmd0QVA0c3ovQjcrUm9NQkZKSkhkRktT?=
 =?utf-8?B?VDd0d3k0VnhXa0Z1RzdTVlgwa0ZFWm5MdWg4dHlvcjlWL2lMREtxdXNsWldE?=
 =?utf-8?B?RnozektOaWhLMGhvWFBCM1l1b2Evakp3NVBuQjhKMEZ4VlUyUmRvdGI4Y1Yr?=
 =?utf-8?B?UTc5WE0yS2NtdUNvSE5uQ1dZYjdOenEzWi9UdjBlMDU4aXZyRlpTdXFvc3Y2?=
 =?utf-8?B?b1BFWkU0cEF1cVJUY01ZTURDWkhXeHB5UEFwalpFdUpDMnhHTHN0WTVyMkNV?=
 =?utf-8?B?RjlUYytObVBvZHRPbERrd05FTHFybDhWVDdDVU80WGkxY3drazgvUkMzNFNu?=
 =?utf-8?B?R2FDOEs3NTVVdTFGQTRCRDd4ZHRBc2hNeEN5YjF5Y0VPdVZNUVlJd2JkUWRQ?=
 =?utf-8?B?R2ZYNW1vaUhka2ZCV2gwczNMbUJxQS80RHdoVDFsREdtL3d3ZmNKdTcwOFVZ?=
 =?utf-8?B?dFJtNlhoMFV5N0lRSGVnMXk1d2lKcFExeE91cmwvTVFEblZsNjBlRloxVFdR?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cf516f-b631-4c49-415b-08de2764f99a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:12:57.2226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dr31uQ614FxYd7bQhXA6QOzIPT/FAYKAYiTVBQxSudPs6xfNZXFz90gzDHR4xz6yHg9zpagDTjhwnZIFF1hVFLUJwF+efheGArb6YJCTqpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11299
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 12:13:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8081

On 11/19/25 12:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Wed, 19 Nov 2025, Quentin Schulz via lists.yoctoproject.org wrote:
> 
>> Hi Robert,
>>
>> On 11/19/25 12:25 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>>     i ask this only because i recently moved off of ubuntu and onto
>>> generic debian 13 ("trixie").
>>>
>>> here:
>>>
>>>     https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/
>>>
>>> one reads in that initial note:
>>>
>>> "The examples in this paper assume you are using a native Linux system
>>> running a recent Ubuntu Linux distribution."
>>>
>>
>> I think it can be relaxed to "a native Linux system running one of the
>> officially supported Linux distribution listed under" pointing at
>> https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#supported-linux-distributions
>> which is what we test BB/YP/OE with through the autobuilder as far as I
>> understood.
> 
>    i wouldn't go that far as the examples in that guide do indeed use
> debian-based commands ("apt"). i'll give this some thought.
> 

We should probably simply link at 
https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host 
instead of duplicating the instructions and being at risk of having 
conflicting or outdated instructions in one place or the other.

Then I believe the rest is distribution-agnostic?

Cheers,
Quentin

