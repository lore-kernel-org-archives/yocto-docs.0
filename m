Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEAACF45BB
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 17:41:05 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38678.1768239660705000391
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 09:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=V3pyBNQn;
 spf=pass (domain: cherry.de, ip: 52.101.70.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hm+Slsa5fFhaWEMpoMG1PJDSPA0Ku23ZSusLGwRqNeTdZ1opCOMmOR7sgRTgIwZCSgO+b838zmq6Y3TiLs3aUcWGqEBMhHicVauIXLINU3w65KHEfCJfxpP8WEGbP9IUOrA7NO3wDaVxTqgjPZUu5pphlpXqbGRtSVVLdbEclWPLQvN8c4jpjwQRsdHGJiKML7LxNMBNTNLY57uHTGgzZC5d1zu8cQZZIi1WLJEwfLj2ezw9SM5K7rixpvR9zqIN32Zon53U55In+y/ms5r5ETcODq0V40lJsuPZwp68FbXzkFvL3bO4fZjJQG+0+FC7doov9p+6rUN1wKBRwTHxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IT47cALTVhxswyQD3eb370HCtSJpizD03IJ7FsBOu8k=;
 b=CaOT044aWBASBIbchgq/Lg7OTh5fdYRCrnxs4ifBETWf7mP9qgkrI7z64xIrl1wpgnf/SqRcgLeVnoUqOxKMxGpjAnR5+7pqWiuxjRzpLgWKlHyaQSPBd+kDmHog36oyRyB41ss3EPNYkg5H1oeP1eLYYbQbV3kSVVy/AKjVdYi3HQKlHoNoLctvpXptd6hIpmmeX0OKh16m3IDJkQT9+CRT4BbHog+KwAbq5RJsCrGFod/zeyoOchuonZvcO/Pac3n7R2qS6WGANZeOFpgYg1pFUh9syqZrtrlO1mc4ESnUimf7sYa/Cx1i4mvCmvME+0YEjz5mtc+teYah1bgOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IT47cALTVhxswyQD3eb370HCtSJpizD03IJ7FsBOu8k=;
 b=V3pyBNQnkGAYrPStWkuoSHKR3F6b5lcV3rcVxfAGQNtzCd8f1iFwuh3DSWUoMRhPIB7JMD7KN8Q7eJqHW/UVKm5VXCn322a/LZ0G5CkhzXZlmgIwjzcCrQCUfqU+LVsbEAajcRfTt4/MqX8Js8JKzNvmedzEaesPEhJSDhXy7K0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8769.eurprd04.prod.outlook.com (2603:10a6:20b:340::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 12 Jan
 2026 17:40:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 17:40:56 +0000
Message-ID: <f98abd3b-78da-4d20-886a-a08284d88641@cherry.de>
Date: Mon, 12 Jan 2026 18:40:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca>
 <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de>
 <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca>
 <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de>
 <21105206-6e15-da26-2da0-de604fc4c905@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <21105206-6e15-da26-2da0-de604fc4c905@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce2fac7-a918-428b-89ed-08de5201bda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bDZ6UmxRa1hhdy9CMnFjMkhYeE50YUU5Q1BHTDVlU0U5WWc3UWdhaXk3WGcw?=
 =?utf-8?B?ZHFoZUZ4VjVnSS9RWmJFMng4SkswWWthM0s0eDFGWk5KbWY5VnhORlVLRTYw?=
 =?utf-8?B?b0NHTUhoU01XMDVlZzYvWE00aVRDbTFNSmphd3JHSG1lTTFLM0V6b0dnSTNG?=
 =?utf-8?B?b05SeXFwaytGK1d2U2paZ2JMMzZkdDlDZ2NVNVZGNDM2ZDczeUszTkdVTVRm?=
 =?utf-8?B?U3RIN0ZqSk50cVVPYWw0a2tsaHI0Q1ZtMjIzQnlWcUlIa1lmb2xzZUJvVWx1?=
 =?utf-8?B?VTRWa3plQVNkVGUxemdwSmtXU1Nrb2NFYzNhclo1NGlNNENXa01aR0g0U2VW?=
 =?utf-8?B?ZUJ5LzF4SzhsMUlPZ210c0xmeVh2TVVzQ3dvTjlJeW53TEp4VC9kWC85UDV6?=
 =?utf-8?B?dHUwem5iVVRlYk1oSHZ1MkRyUGdLZVFDOE96ckdybHZUNFc0TWFPNEpYV2M1?=
 =?utf-8?B?dWJ3cUtiRGd4NG02cktXT05lVlpwK2dtTFc2QkVnMDBtMzR2V0FDWWlrNEJZ?=
 =?utf-8?B?Ynl3a3pOZkh4bU9scUN3V3FMZXFhQmRZSUgxTjdpeHVGWFNoMXRqbFU5UUxO?=
 =?utf-8?B?MnE3NXdvbytNOThMQjJHQlQ0cXd5ME1kMEdGTTk0Qm5NYTl6YkJYSU0xZjFs?=
 =?utf-8?B?bWZQdXE1RGJVYlNZNnB2TVJLRDNHUXlaZHRaYU5rMlVya09FK09HRy9hLzFi?=
 =?utf-8?B?eUx6by9lQVg3b1NFTjBaU1FKKzVKZFJhbXZ0alpKa01oaFo4Zm80VlZjM1lB?=
 =?utf-8?B?SHhhNlQvUzY0SHpQUUQvNmQxVVZ5akdQcDM3Zmh2cUN3L01OM3FYTmx6bUlU?=
 =?utf-8?B?eURpckZHcHltQlpVTTBrSGI5NG9saFFCaG4rYVJMK2h6TE52MThQMVl6OHBa?=
 =?utf-8?B?emx4bndKY2k2UkcrVUF6OCtOTWZFZUUwSzRWTFpGUTNFa2VyNnYxd2R0TnMx?=
 =?utf-8?B?ajZvaTUxeUpySloxSGJlR3VrWWI4blB6ZU1ESlpQbnFtRTlWRitTRlFnd0pz?=
 =?utf-8?B?MExwTnMvV0VpSHF4R1VXbEg0czdPdXJ2b0pHYXdieVBjQmQzMld6d25NbDYv?=
 =?utf-8?B?b0xGUCtyYUk1MlMvM215OHF1aXF5ZmRaRjRScldwdEpqRDBab3UzUDFQTFhk?=
 =?utf-8?B?T3RYL01tNnBHVnJXU0tCZDUvMy9XWGhJUmFxSE9MVU84RktJUnM2RkhEdEZM?=
 =?utf-8?B?bnFtcytjWnlxWWZBeE15cGJLTUIrdVNVV3NBMk56b1k3NXhtQ2pZcmJDdzJX?=
 =?utf-8?B?bm01d2R0dDhEYVlQb1U1eTU2SzZZbEdFV3phYk5HRk1ESHZteTJLbHBPdFdh?=
 =?utf-8?B?ZnphdXJpTGpIR0d2OGx5NC9uVnE0dEtQK1BrL1cxYUNaSlBXcmVmMGgzMkxo?=
 =?utf-8?B?TXdzeE9DVGJMcDFwUEZXLzlLc1pHbXoxWDZkUnZ1ZWducllPL2hPR1MxNEpK?=
 =?utf-8?B?QUlVZkhtNGszaWFiOGQ4czJPNlh1TDczWkVWdDdhaCtEQXNiY21KeHFWM3o0?=
 =?utf-8?B?NDRoYTd2eW1mSFBlbXY5TEJHRktmMnpNR1J0Y0VKeWZndmR0RzY0VUt6T2Qw?=
 =?utf-8?B?ajNXNXY4NC8vNytKNWpLdk9uSDUxdzk2WlpTdUJnb0haMlFCdnFFQ1orM1dZ?=
 =?utf-8?B?M0VueDV2bGYzb3hhMEhmQ0dVOVdSeGFqaWxvaGlIK1p0ZGJ3cTRmdXpUUndq?=
 =?utf-8?B?UHc4cUQzWmYxNWI4UE1PNE9qdVBZUTk1Y3pqZjhBc3hncHp4amVGdzJURjdT?=
 =?utf-8?B?THNqbmttM1hlZWEzazgwWGIyODl6TUd5NE1MSHN3Wi8ySTRLUUFMZVdvUXRi?=
 =?utf-8?B?SENBSVBCV0V1dmU4VlRDRUY0aVhDMGNHRmMxdG0vc1NoL2J1eEFEeGFIN1Yz?=
 =?utf-8?B?aCtMVFhpdkp2QUIxWE94MVRyOWtBUVdKMG9Kelh0VWJFdnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Szc1bG9SQ01BUVpVVHZ5Q0ZtNlAzZ20zNFN4ZnYwWkVGRW9Yem5BSm9STGZx?=
 =?utf-8?B?dkh2QlpScjNEb1ByckxvYTNHaWtnQ1JudDNNZzR5cUZHNG80RE54WUdMVGRB?=
 =?utf-8?B?TzAzKzE0Zm9LaHJQYVZmK2dwZTNXbnNQdWZWdTBjRVZEbEIzVDRWK1lhNHRC?=
 =?utf-8?B?dG5ubUdoY3MyYkJ2bXBrZElGUXdoL1NIcld1SGRJVEttVnlsQ1JHS3JBZHg0?=
 =?utf-8?B?bk1LeHRBVjlncE9rclRqelFrOTRDd3V0d0NhZEloUGZzOEJXSlR0c0xOVy9t?=
 =?utf-8?B?RmRUUFNvNEpxZWYrK3Y2VDB4M09SMzJNcjJ1RGJNc0xJNUFGMWZuamhZK0ZS?=
 =?utf-8?B?Q0VxcjVhYjVpZEpNViswK0FJc2VqRGRVSFVBVnlPeXNuYkRjM3dvbU45Wi90?=
 =?utf-8?B?anQrQ0VvWFRtdzd5SlhPdjgvaFV3cHNQUnVUeCtySG12VkJrOU5yMkhtenR4?=
 =?utf-8?B?akF6NTZLU29Fc2NYZkZRNWtiREx1ZlEzc0p2MHp0K1dTYnZFTS8rcXdpVkZL?=
 =?utf-8?B?NDNWVG9IZ2U2VVd0M2I2SS9BN0Erd2xRWUNVRWtKZW5EcTVWVEFHS0tpOVJ4?=
 =?utf-8?B?b1pMaU1rd014eEJlS29TSDljRTNGbEViQUhtUEdmNU9jbGJTbllnVFJsSTNJ?=
 =?utf-8?B?NFMzdVJPT2Nnd0xPckNiSUNwWVFLZmUyNzdZdmNtU3hBMlpoSjlJU3UxRW5J?=
 =?utf-8?B?bDA1YXlQdGprQklwdEtvZXNKK1NWbmdvOTRmSXlrWXhCVGFHcndnb1JRUW54?=
 =?utf-8?B?Z29yT2VHN0w5ZkVJZlNFVnBGNkRSNVU1MGYwYmM1V2FROVp5emE4Vi9IQ013?=
 =?utf-8?B?WnlyaXNCOStNaTF4VjFqUkExOE1GWnRtWWpqMFZkSVFsVDYrUURsUm1GZUgz?=
 =?utf-8?B?ZFRtKzlPNCtzM1B6dDlwZ1NRUzM3NlYwUStaNkwrZXU5cTZoU3UyQUl1Z2Va?=
 =?utf-8?B?RGUrOWZNdDQ2YlAzdVFkVEdOeFRYQjJRWSs3OVdhNVJQZWxtNGI3emswN05n?=
 =?utf-8?B?WjBKU0dPTnQ1U3ZKR2ZhUGF0UlpPUGVoUmlpQ0dFYk5SaUhuMkFsNkQrZjVC?=
 =?utf-8?B?TUhVWGV0SVRyaktrdFZTd1IwaG51Ly9NWUw1aGx3clVPQ3lkdFdvdFU2ZmNZ?=
 =?utf-8?B?RXFiT1lqTjdmaVVlcE5PVzU5Nkc1ak5uV1pLdGNBbDhyc0svRUU5d1plZFlE?=
 =?utf-8?B?ZlBJQnc1NGhrRHo2ck11a0dmalVRc0owRTE2TlBqTklnRGpoOHpOWXNHNjZx?=
 =?utf-8?B?dmFtYTFscUxTUHQvbjBKdGNFRmRmUUlKc2l0SjE0MmYzTlpQRlJCd0JOSzcy?=
 =?utf-8?B?cFlKUUtjbGFtR3diZUMwdVFnclZPV3dvTXk2UVcvVkt2Rm0xRzk3VHdWOUZB?=
 =?utf-8?B?UmwzODdjdStleXlCbEc2UUlyMlprUXlGdGZidC9BcDdlT3laTEVURFlPanhG?=
 =?utf-8?B?TUNZQW1meUtKbEcwbUNQb3Z3cE9wOS9SOUlqMmw5ZWtsZ0g1SjhrRUN5cmVq?=
 =?utf-8?B?cGhub0VLbkhDL1pNZlFnMHpmNGpwUFVIcnV4ek83cGtnQTVMNVZIRVdNZDVv?=
 =?utf-8?B?bFg1cTd4bzZMTkJxOFJ5aXgxdTAwbTNsYjNTNGd6QURiTm9UYXpPejhXNWZx?=
 =?utf-8?B?SkMvVVZqZ3pBOUV1b0tVU0ZRdWlxZWwvSXVmRmltYklaaFBoSGpyUVRnRzhO?=
 =?utf-8?B?TGtCNHNPc1JaNzVYd29SR0MvTkhOSXZmWGc4bTh4MkIxNGxJd1ZWVzBiY3ha?=
 =?utf-8?B?RHl5UnRXakR0cHMrWFpUQllZci9BVUFpVE9SNHFXS1RtVitWNy9xR3o3bThs?=
 =?utf-8?B?Nnh3dFBkbnVjOUxyV3E1dU04eE9NdmQ5cjVCZ01HNGVTUjUyaFdSMk5HZ01s?=
 =?utf-8?B?SWt1VVY1TTBIMnpYT1ppejFBZ1Fuenh2UkxCRm5wVXZpNkZZSktzRGxPU2Q4?=
 =?utf-8?B?c2MvZVBTVzgxWU9tbnNJanUyOTNQcmUxQ2NCWnBHYjVJOG9PN3FhN1ZkYzk4?=
 =?utf-8?B?NkFzU2Z4dG4yK2dFMEVwaCtJMW5BejB2Z0R0YWRqRytqUlJsMis0Q0dkS2ZJ?=
 =?utf-8?B?Q29uOGh0ZWF4MGp1YmdNNjdFTnduTVhneUtnOXg5c2V1eWRiQit3UDRLL1NH?=
 =?utf-8?B?L2FxaFJnOEpoUHJMOEpSSFV6a1p1TDFrK2N4TGNSSUd0aEpxT1liN2pEaC9y?=
 =?utf-8?B?RXZpK1FVZDBEd0FvcEoxVVdRdkVzRjFzUFR0Rnk4YVg0SXpVc3lSZ2lvOS9x?=
 =?utf-8?B?TERpWUROUDBuemZUQmppSTBTbjV6SXF6WFdwMGJ5ZlNHbVhkUW9JWFg2SW4r?=
 =?utf-8?B?SktMbVhhRXVMTWlFSnloUXEzd1lEMzZXQVRvbXI3TzlnamF0elFxUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce2fac7-a918-428b-89ed-08de5201bda1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 17:40:56.4052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nWzIhHwkVr153M4Pa3VOTN40pfCG0v9JDvD7oGUI9oS+THoj9NKV9QEi58CQlC3FbFs1qptCJqLAudt+80Whgi+jR7/YwqQZhBbEMXQc+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8769
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 17:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8472



On 1/12/26 6:21 PM, Robert P. J. Day wrote:
> On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:
> 
>> Hi Robert,
>>
>> On 1/12/26 5:50 PM, Robert P. J. Day wrote:
>>> On Mon, 12 Jan 2026, Quentin Schulz wrote:
>>>
>>>> Hi Robert,
>>>>
>>>> On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>>>
>>>>>      more nitpick ... here:
>>>>>
>>>>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality
>>>>>
>>>>> last line in that opening section, why is the phrase "configuration
>>>>> fragments" rendered in monospaced? is that meant to be an actual
>>>>
>>>> So it doesn't feel left out with addfragments right after being monospaced
>>>> too? More seriously, I don't know, but I wager the intent was to make the
>>>> text
>>>> italic as to highlight that it's a two-word term?
>>>>
>>>> Would you mind sending a patch for it?
>>>>
>>>> While at it, I think it makes sense to modify the "``addfragments``
>>>> directive"
>>>> part with a link to the section in the docs. Maybe another patch to send?
>>>>
>>>> Also, this pertains to bitbake user manual, so I think it'd make sense to
>>>> add
>>>> the bitbake ML when asking about bitbake-specific docs (both BB and
>>>> YP-docs ML
>>>> that is).
>>>
>>>     I notice you just posted a set of patches to fix a bunch of the
>>> references, but it also seems that there are different syntaxes being
>>> used for some of those references. What is the blessed way to name and
>>> set references across the YP docs, and the proper way to then access
>>> them? There seems to be a lack of consistency.
>>>
>>
>> Can you write down those inconsistencies so we can discuss them?
> 
>    let me check if i didn't just misunderstand. it might be that i was
> confusing how one refers to am implicit ref associated with any
> section/subsection, and the longer form associated with an explicit
> ref definition.
> 

I guess you mean

:ref:`inherit_defer
<ref-bitbake-user-manual-metadata-inherit-defer>`

versus

:ref:`inherit_defer 
<bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit_defer\`\` 
Directive>`

and why we have a mix sometimes for the same cross-reference, or for 
different directives.

The answer is likely "we forgot/didn't know we had autosectionlabel 
Sphinx plugin enabled and added labels by hand". I would be for getting 
rid of the manual labels in favor of the autosectionlabel wherever 
applicable and mentioning this in some README (I believe we have 
standards.md in yocto-docs that would be more appropriate?).

Can I interest you in sending patches to make this consistent across 
both BB and YP docs? (Barring Antonin disagreeing of course :) ).

Cheers,
Quentin

