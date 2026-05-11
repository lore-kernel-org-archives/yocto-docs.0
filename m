Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB65CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 12:35:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49181.1778502906198994615
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 05:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=L9oNxlJH;
 spf=pass (domain: cherry.de, ip: 52.101.69.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkIm9AZAnai5ESka/vTBJcsfokVB24UiZYwyVcsCJj5MAZuRTJ0uio5OuWrs4ltmHHbgy94O8aRN1Y9BsyQkk47F5qCOWwas+U2l6eXr7R7KMF/b0jvH1MCBpLLYM04N9e7fZeXg+fcErMXla351WWydXl9X7WQ3gRD8jSvbvSGwc/B/XD2YZPyN30psW4wERKQRYDuFkKgusSPLqMGnj8391sxiubz49zIaInRjHGsSze7YfsgAMKOGXPhkWf+atjOMfk2qK+siX4SS4EtNozTgYTPnHq7dke+d04OcemMD9Zp1IL6wfgQxPAaFRvHSV++71f63ZPBot7iHuzN9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr0AKT3dZpJgFOyznasA8JALlg1ZkoB3HROtaNuHjhQ=;
 b=P6k9N4cVCod5Uxj2zNgJ2YpHQDb0/12OnIwXSHLRWMSQKaEJR3tLCn8OKIjxp6qFhOprHc2gEDNqcGRTk9LngOq5PQAptIc6I0wN/vMFGGikEgzsTrYk+wbEJpUE526IhwFxxmCTDhvwdutWbE882j1v2yRbq3GYsdfSbc5NJAGo3oR20M9knCs6af39Vs7Y16MPPpBUZk4WkC0qoeCgIp2MDhf2Y9Wr72WJlEAf7Ca5W9+bofkBxt/ZvMV9L39OolaXTQK6L522ZYygj7ZnJAxdbAhIrSbczhtBSn0CwIu7xJJRxCqkfZi5Zm3FRjcY5yM340nEcC6CBnHeSwWXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr0AKT3dZpJgFOyznasA8JALlg1ZkoB3HROtaNuHjhQ=;
 b=L9oNxlJHzSG9IZ+rohwO45li+DTnG/HdoAZCPixuQd9uDKBQyoVH41srB9pZRnb9AFpRY//niiKj30l3OPl5JAlibsK8C3neCWa/KG3WenLZHFVBKrXaLoKLAUswW2DWF7TIY4CvRToteqbfoLeDkIgiXrRcK+Tr3rTbbV+ngYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Mon, 11 May
 2026 12:35:02 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 12:35:02 +0000
Message-ID: <31bfc97d-0746-454b-8e4c-d436577eead8@cherry.de>
Date: Mon, 11 May 2026 14:35:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] What I Wish I'd KNown: Various pedantic cleanups
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
 <f3864725-4661-4a05-b284-aadc84078d3c@cherry.de>
 <44d3a34a-4c8a-e652-6f1f-b30ee156a836@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <44d3a34a-4c8a-e652-6f1f-b30ee156a836@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI6PEPF00000204.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::914) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7a190b-1d4d-403c-9d6a-08deaf59b8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	T6PAbdGtu4UNcEDSdXvmFO8UkS8h+xn+DN3tzWFfmsUudQyYX13ohPoP3jTkU3Vf7x4KXlnFnzEsVJ3twDdBb/8qI/hq/KhoN237FtextLelSn4VToTjuifHoNZ97E1QhS5BObNuyA966lt72BOvszT4NcoVKg+ovuwm3HFynVwGkpa10Uk4qRSNxeCda2Mna5NVa5uJ32qfciIlyAzEvXul6BN1/rBa2iGR5c1+4AOcQdLFtM/Q4speHPmS5B1S+zOqc4Lu/KrV//dfV/6fskuW8k1rxxeW5+RA4Ike/e77pyrvRfwq2jyVRIWGQc0ILnRGSc9XUrsq2HV+RgaSnm1JaTbMLWY3i7rg5lgkcbLp94JhXSNFJyixa/OXsx5UXwMKc9cNpMondFxjj1bMcgS6E3Cb++Ij/vs7TZgNoAZHhRHtmXIAOCosNPrQCHvDeSQcPlwGuqhq8GlaHOo3PGyIY39+oAyEWpkEhjkD/qjjbBm/vJl0APF3cwFq0c3g8wyz7nG7bST64ne7O5WnVGumLiX4yN8JW1yG2I0xCG6sVi+hDhGDw6ouT82+PTcITCxjIYxAaRRCJXR1X7SWji5t5+GRl1R77XZazDaKMGp3GxiUMKQuUd0CbPv4pVf/rGleHS1jnyhYtOW1NIXJ2uZi4M0qTcz3dxXR0QzsqsggNph8uQbDfLweNELP34h4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SElxOEthY2hBQjNuejdiYkRJSG9UYS9OQjZ1VDkrcXRBa1ZWaUYzZ3pieEI1?=
 =?utf-8?B?VU1zOTdyT2U4YVFEbi9Sc2RkZkFwMTVZZDJSTnNnOGdta1pmZUFGS0xrM1pv?=
 =?utf-8?B?Y0h6Zkx2UVNMY1JNZTBRVHBXbVlqNk1GeHRkMUw1MUxIaGVVc3FQVHY5NWRw?=
 =?utf-8?B?U1hyYTMwM21QY0M5QnpTczBxbXFYZHduck4vMDJWOHFxQUN3dzJpWVJtUmVw?=
 =?utf-8?B?WnJkMldIRVpHM2UyVXlTaTZxdVpwNTV3RzZFbyt0MUdwSVI1UU8zREQ4N3ZB?=
 =?utf-8?B?QnJwc2FyMlh1eC9UZ2RKaFdaWnV2d3l4Y2xGVnJGYkpjMWhoenlKQTZuYlJN?=
 =?utf-8?B?ZmFTaEkxTGJDd05mRmJYdURsM0lsRVRVM1JFK3lzREJVT084RUYvZmNTNVIr?=
 =?utf-8?B?UStkU1JaYWt1V1dGR0xDMXhZdWNYU0J4TXBaZHNteWNndWt2VUZOYWtCQ05Y?=
 =?utf-8?B?ekw2QkhvRWRPcm4rdWZRZDRDOVJPM1h1TmRCZHN2b2tDZytKa1RTd2hTc3FC?=
 =?utf-8?B?YllwZ1Z2Zk5vbkJOZGN6NE1nK29PRzJFMFNTY2RQa0pLajZvWWhQdmorSGsy?=
 =?utf-8?B?VDJhYlRsTXR4VWVNTEEyRTZQN01MN0JRVDJubzhkZytEaWM1ek0rd2NlSEto?=
 =?utf-8?B?Q2FNdG5OdmNURzhkOS9EMHBqV1I3YmpJbHlBdHdDMTlITUlwd0VHNnVPb0NB?=
 =?utf-8?B?MUtkYUFxZHhFVExCdGcyaUZ0N2pKbU9tSUs2QTBEYXdhRWZ6djdCM1BnRGV6?=
 =?utf-8?B?N2NkcExYV2VDTXg5cEFhUlhRTGUwRm1zRS9xdTQyQm5xaDJyWHBzRVZOYnp2?=
 =?utf-8?B?K1puSG9TZnN6VFBZdTlRRFdLcGZMZFVHWG92aVNVUGcwZWFTaTBXc0lCU0pk?=
 =?utf-8?B?TEFNZ3d1MzhnM25Ya2wzL2I4bGJQa0FGcVZKbjJhTVpkZjV4eXdMNkdFNzZt?=
 =?utf-8?B?WjJrNGY5WTFRZjN4bXZWOGszYmV0S3JnMVJqMW5TaFdDRFkvSXZ3aXd6R2Jr?=
 =?utf-8?B?bTUrRGw5cSswRDNJY09ETHNZM2dLY2lSMmx1ald5cGJ1TTlnZ0lYeUxoYjFG?=
 =?utf-8?B?dTY2YnErbStTbHFQYVppVmVaamRRSGQzakJKRWFxQUJhRWNpU0lqT0hYWDQ3?=
 =?utf-8?B?aVY4M1dHVFhXQllVdkNubGNMREFvVEQ1SUJJYk4xSS9wWkczVjlic3FpRXo3?=
 =?utf-8?B?N3JYNmRaOWNBcWpJem9RRmJTdlJrR2JPSnRlVkVraXJvMlVPNXF4TDRUY1Rs?=
 =?utf-8?B?Ymh3UmMwZEZrRlhwOG8wRUVqSU9XU1FTaDBrQlZiTjh5clRpMnI1bk5sTUYy?=
 =?utf-8?B?Z25KVXlLYVZrYWJ6N1RrNHpnU3B1cHFYdHRBek1UbElUTUx1SXNyeER1NkdI?=
 =?utf-8?B?cHFUbmZkVDRSYk02YWtjbE91UUZRMUY0NmExUVhqYUVQcmZmMEh4b3NtUEUy?=
 =?utf-8?B?Q0txQUFMV29mSXJIL1dzZ3psTnNGR0JidUhNOUc5aGhMcEdQVTlRTnpTTzNl?=
 =?utf-8?B?a2pCSVlHay9IQ2t6VEtWdi80RjQ1OS8zY2NhcW1UMWs5Q2RXYU0rMFBTN014?=
 =?utf-8?B?LzRPZmJLV0ZWTklXenJoNjdnWWxXWGwxa2E0WllnOEMyR1hJWDQrUjBiaE41?=
 =?utf-8?B?cTlyQVcrVytwYS9BYnpUcnlVNkxuSk5zbVFDMWJycEt6VGFuWEFtaFlBbjYw?=
 =?utf-8?B?dXN0YjBvY1ZTTndyZmt3SzVJTE9sN2I4RzRMVXJZZ1dTd003WlpSZXhUaXJD?=
 =?utf-8?B?aTA1QXRCNTVlZEdtR21wSUljVTlPVmx4V3lqVUZzMDM5cjVGU2dPUTc1dG51?=
 =?utf-8?B?enUwMEQ3cWZ2V1dySVcwTml6bXVxM3VoTGZYRnhsZ3YzVDR4eUhVSytLRlV4?=
 =?utf-8?B?ak5mVlArczFPRzBCMmxnYlhCNVc0RUxjdjJ0S05JV1dqZXpPR0ZIZUJVb294?=
 =?utf-8?B?M09aT1B4MjdtekJ6OFF3YXhGV0pnTm8rUUw4OTQxSUlyMmNxQlB0NVY5K2di?=
 =?utf-8?B?UFBSSDk3eGlsUnlFT0lYQ0FLRmNoRjFHZzZSRWxmWFRLUFdWOUtOZXZrSExL?=
 =?utf-8?B?QmZoNGNVdEg3WnJ1ZzJ2Q3BLT1Y2bXdObUR0THE0Q2JHZjJTUVlNTmVDV1dL?=
 =?utf-8?B?Tk1rT29vQzJsc21ic1M3TEVwVmpJN2hoUXBaMk9oYmU5cWtkVWh4dHdXK2tz?=
 =?utf-8?B?ZzJ3WTNPanJuSFhKQzBOMEl6Q2xUU3N6RmhSaERuMldSME9yWElaQWl3a1lD?=
 =?utf-8?B?WHF4a0NGbHR6U0RnTk5mNUdrc090ZVo3cTFqa2k2YXNoREhocDVQelNzTEZC?=
 =?utf-8?B?dzJ6VlYzREJjbnQxV1VYU0ZVdUlOQ0hxT29RUVhmNjBBK0Z4a2RHUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7a190b-1d4d-403c-9d6a-08deaf59b8af
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 12:35:02.1005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvvwvSPq4oo+1AklU8QHY/pLWUw2qtI7GndPCnGR6iBf9nHhaX6t/lCKJ5+4fsLE42IvxG5gJ/O0B/6Bw2PVW/SBOQXQyUVbe9ws8D5AiEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 12:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9449

Hi Robert,

On 5/11/26 12:29 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Mon, 11 May 2026, Quentin Schulz via lists.yoctoproject.org wrote:
> 
>> Hi Robert,
>>
>> On 5/9/26 8:41 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> Tweaks:
>>>
>>>     - Update "Software Overview" link to go to "Technical Overview"
>>
>> Why? What's wrong about it?
> 
>    Because it simply redirects to the "Technical Overview" page, so the
> link label and the title of the destination page don't match.
> 

Then say this in the commit log :)

Cheers,
Quentin

