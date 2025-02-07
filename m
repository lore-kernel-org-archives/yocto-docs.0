Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60850C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:47:31 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.50])
 by mx.groups.io with SMTP id smtpd.web11.65899.1738921642671223862
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OUjRV2F6;
 spf=pass (domain: cherry.de, ip: 40.107.103.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaT3nHj3QbOZD0Xy9qBi/c/pJZ5k4b965Z/YAij+gkt02vwWoBpk2+d3Wk7Yy0KNUSSfXYKHZF3BkBu2ZGGy8SmfO8zEba2AfqqDEYfnozXzETJhze46k/Mql80PVi9JXtny1I5gMC3TxUHpjU0rKkyaeXgOabeUKU9/7WqgXRlxzMKmQanYxYtLl7Vym+nKwtvlBh8dP6brpAEmpJZMZkktkUnhorPg1zf2MRVFJuE4gFnP5JcJrz/SQEVe33cjUCJoqBdvu8ppKTyapnkNs/WeICDa/l7x1tqCn0nJ7DwKFL6XdgMCJuqF0Wh0vOL2UqvQEtw1L+cm0H7EbWloCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+kGgRP14mQgZkbAadzCTYhGkX5mxp69rSrGcLxQksU=;
 b=Ui2x6gcV3aFW06Kt1fVVOSslbKEMW8CZQcK+JvO02JpPjAsZ7z5Bm8hAFYlQZ3ZBcWA0Mk50zZ9gJQJ5AW/9q+3iy1LSsOXH1dCc6aZY3Bb/bvxsxWNAJJNU3O2jUOYA0OywqBX7SQlVzJUgB7fH2jVhCppkTTgHgxx//LhrJLhhKMwOQ0QR/cLEesDm+AlmSmFLPrHsMGG5IQ/WuXQiFbNHnUqPmKzK+oZon77KAUm5tOSAuO5lQw+7cZW1ItZNHrhTUVlo6EhxVA3Q3Ts2i9Dp9P7TtXIABiPiG8t7JOqBHMQMzbV6yTSE/tb6xgJE16dVGxNfKcDXDyMKW7Nq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+kGgRP14mQgZkbAadzCTYhGkX5mxp69rSrGcLxQksU=;
 b=OUjRV2F6WtthOPziJl+anzA6XVFiofubdXzKbEnopkM1mXz50Ivu0vD/Fhz0osvXmyUETyNGbdX3N01QKPzsuSJcrFh2WSms0jNOTv3fi5OHGCb9H++pLl9DgzWDQLZYrFPYARTnvFejuCDdC6y03jkBv8h/9YGxc/v55MxyxN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7334.eurprd04.prod.outlook.com (2603:10a6:10:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 09:47:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 09:47:18 +0000
Message-ID: <9e0664a8-d4b2-4cdf-9eb7-522bb99c9c3a@cherry.de>
Date: Fri, 7 Feb 2025 10:47:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] add basic b4 config file
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
 <D7M414DI5EPE.22H0A4EO3Q0M@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D7M414DI5EPE.22H0A4EO3Q0M@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P190CA0046.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: be420722-6277-4482-66d2-08dd475c6927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGpBakdzdTJxU2dkR2JlTGdLMGp1NEhGQlJoRnFmUTZUbUNoaFNnK2N0bVlG?=
 =?utf-8?B?QWpKOEFiQmxLbHFYRzRQb1dhREpvVzRZamxrNXppTVcvRURqb05Td0RJemV5?=
 =?utf-8?B?UWZ6bm1maWVublRzRmZTQlpaTHd1MjU3MjNiL3NTaUIvQmtZTkJDTHNSbnMv?=
 =?utf-8?B?Q25SRk52dGF6SXp5dEVaeUFFdnlnVXE1MDYwdm9DVHc0WlZTTFJOSUxGZGU2?=
 =?utf-8?B?UVI2eXBLT3M0bHRiMmhpZXBYZU9WRUxxS2p6c0J5S2lyT05LUDlDYWNDb0Zx?=
 =?utf-8?B?YlNVWlAzSXhkbzZsMS84aDR2cEMweVFjRGJBUkdzZC9lWG03YVdCbmpaQy9j?=
 =?utf-8?B?MW1XTEZFRzk1ZHdOY3UzVWREcnVXcW9xaGplbDc1cHJZQ012MkFrZEgyYjlY?=
 =?utf-8?B?bjMvQStVMU95a1ZqRmN2d1dsWW5ST3YzWWphM2lueElweU5YdWxhNHRNK3ZX?=
 =?utf-8?B?ZDh2YWhsVlZ6K1FJVG1KYTZxdCtUbE93alVmK0RKczNCczliTktpeDYxNHd4?=
 =?utf-8?B?K29SUnZJWUxBOC91OVNrM2pjcGYvcDY0YWlLM2dSd1VNcXBMdmwydzBnV3NX?=
 =?utf-8?B?dk55dlhpb01TTFhaUnZVcVMrMlgrTUQ1dGs4UlVIdW1jdnJHVjl4Mzg1dFpv?=
 =?utf-8?B?VVRYbmJHc1hYaEp5STMwOGRmYXlWWXdOTlpDa2ZyQlByOHNIUW4zK2xleE5k?=
 =?utf-8?B?K2kvcjVJM1h4SVZnVmEwU1BDbndTME04Y1lxK0szZGJSb2drRVBQZUNrUDNm?=
 =?utf-8?B?VkFmMFgzRHI3d1RTbVphVzBuY0tjTHpTcjFxd2dDb1VaRU1WU0ExMy9UNFQ0?=
 =?utf-8?B?bXNsZ1AyZEkwZXVHenBnUElTRnpUMWpHNEpVamZqUXkreVV2RlhTYTVhZEMz?=
 =?utf-8?B?TWZKK2ZjSE1pWnBWeE4yclc5aUQwZFBLWm93YnpYZS8rcmJ1MnVvNVpadFpq?=
 =?utf-8?B?ZTc2YTdpelpTRGczeTF0WmVLZ0dyMmp1bHFFcVBITXBEMFhnckZLdlhMUk9Y?=
 =?utf-8?B?TGIva1NlU2FPK08vVllaa05rdGI1TG5wZDZYRjd0QWZ3U0xsRW5LaStmeHlm?=
 =?utf-8?B?UDNCNGRyeWdSYnY4VksvODZDV0c3akxOSFF1OHVHYlRyR3FTWFVZdVRVb2pu?=
 =?utf-8?B?OVFKVkZLWDhDUXRwNHFHNEd4cXRnUlh3bmIwbzAyRm0rQ1laNlh5M1NueWRm?=
 =?utf-8?B?V3JudXZGRHU2WHpaa2VGb05JZ0JGRVVnYXJDUmtGc0Y2SkZKUEdCZ3BQdGJ4?=
 =?utf-8?B?UmkwRkVGdTFjckFiM3l3bzVxTVBuWUxZaHFnNndrSHI2RXN6SzljQVdpTjZk?=
 =?utf-8?B?WlcrbWNESXh6WG5ZUnI1N240U0dWSG5lbDFFdVFkekJtVTVTak43M1U0dVRS?=
 =?utf-8?B?cWQ1dnFQb3JpZTZTRzUxeEpkRExxTkZMTHpWNTgxQTVRQ2dmdEd5R0krYUcr?=
 =?utf-8?B?YTF2ZkpLNG9vdW5PWFpySlpnNW5hS3lVZ0o3NXk1UmlBaGlDV25RYk90aXk1?=
 =?utf-8?B?YlBsc0FrbWdvYWpDSmYwbW0zQ2RiWVBuSm4yVUVxWnlGbXFLaFBYaW0zdDZL?=
 =?utf-8?B?MCs0ZmJNU0dKamhjbnNOaE9NK1QzZlRlN3pJZTJXaFdSOVRiTXJZeFlwTzgr?=
 =?utf-8?B?NmhlVGppeHg2bkZBZ3RHQlhIaE9iY2FiZ3VheGI3dC9ZcjRWYlVEMUlNWXRo?=
 =?utf-8?B?YlpPa3FmcklkSWg2U0pNb2hiVExiRVJvMW50UzNkeTcxN0p1b0sxejBTK0RL?=
 =?utf-8?B?QVpXUGR3S0l1SHZ2WWQ2QnBzemJONlU2bDhHQzRxdGVaU1ZoZDRKS0lucmQ4?=
 =?utf-8?B?OVE1Y3NJSzc0ZHMxVVk3dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2FIZ0Vlci9xams0SHFiaVN3bUhHOTFEQlVXL1czWnV3UW8yczRvVTVSVGNL?=
 =?utf-8?B?K0lLbUZ0YzhuZHdaRklUUDUwUU5vTlN0blFkc2RoNjc5M0pwd1N4Sk1NU09N?=
 =?utf-8?B?MHNvdlRGeGUxallGN2p2T2dQMXVCOGdENTVwVDA0YkhWU0F5cTBlNVdMbUd5?=
 =?utf-8?B?SDJuRzlmTUhCNUxRVTZPTmQrYSt2OXVsaWN1OWFiLzJvdzVwelAvTS8wdUtL?=
 =?utf-8?B?bDhRaURIOCtKVkdnWjQwdWwyMGw4Nkl3MURwSnlHR2EzbEtsTGl5WjBkVlJ1?=
 =?utf-8?B?ajZBeW1ORGdrb1h0eVZXUzdFSWIrbFB0aUtNMy9PZHd6Mks5V0hueG5QQ3F0?=
 =?utf-8?B?UjkzeXZKVExDYlJPamFYOFUvK0UzUk83ekZFaS9rbHkxd0t5T2VJelh6ZmNo?=
 =?utf-8?B?SWlUaFgraCtwWTliOC83bWVPSWsySjRwSkxGbWhYTEFrbjd3TG1pM2pIMXF2?=
 =?utf-8?B?VGNFNlZUeWFTdjhrbldZSURucElTYWpPUTZtLzhBTGVTUjdQdHNZRThMclpK?=
 =?utf-8?B?OE5KZ3BiMWZ4ZDBOS0lYZFRvM1lTR2VnVDlFNEl3eGQrMFFseXVVQmZLNjI4?=
 =?utf-8?B?Tys3dHRBczd5bVAybGFkM3hHUlU2b1R1dllmemFYMHppWEVtbzBWN1V4WmRY?=
 =?utf-8?B?ZXdzYlpaU0lTcnVuaVQrcXhhaWR1TzdPZUtrYk8rdVdYUEdBNkVFTUVjOTRB?=
 =?utf-8?B?TGhEUGkvRzZGTnYxTEJTWXpQZkhzUUI0VDh3ajlLM0xnK0VPbWdNR1phSjdu?=
 =?utf-8?B?K3AraTFqU0FhTE5JSExlOHJ5dVRnMWtpUGxJNlpRWFJ2RERTTXRGVXFxY0Zw?=
 =?utf-8?B?YXJEYUdCWm1TL2JTRmtBbEJwRld4SU5Ea2tXY2dnQUpBV0RyY0lkRzdQc2x2?=
 =?utf-8?B?dW9iRDN1VHh5UFBsK3FtUXdDRm9vZGJpbWlpazdjQlZlcFpJRVc1aXEraXQz?=
 =?utf-8?B?TFhGbHFxMmRraHI4TmJ0L1RWVzU4NURiVnNOdVlZaDBQeEtPWTEwdk9OQW9o?=
 =?utf-8?B?OURmSW9tRFdISTRwS3RDQU1FL0F6Z1drSzI0K0VnQXUxeXF4elFpTnZJbWhS?=
 =?utf-8?B?R2o2YlNHeDhWemF5VUZOZDRZR2psdGJUMnQ2eXhjaDQ1L0tvZmhxamFra2hX?=
 =?utf-8?B?T05EQ3RISUQ0SWczZkFuenUyV21UaUxtdzNiZzVSUUYzeEl5Q3NRUnl3MXc3?=
 =?utf-8?B?ZDNqcm13djIzYTdSK2RPZmoxZTM0bUUrYk9jM044eWV1dEhhZndyN2kzc0gw?=
 =?utf-8?B?Wnc2b1ZCMUtzTmZJcHJNa2tXNHpZK0FwZEE5MmRjWUhaUGtEV3BLMEJMcGxP?=
 =?utf-8?B?bG5XTlROcGF6cElVRWhLcVU3WFFXZk1WZk9WWDBmRGJCbkNlMVRpZ05RVHdt?=
 =?utf-8?B?MDNRQnF4aGdOYTZ4ZEhNejNqQVpZQjY1anJjRzB4S3pJNnRQNEo0dXlvc1BB?=
 =?utf-8?B?WUdSNFZMc3I1U3UrN2xCQWNNYlp6L21MWWJUZ1MwSmFKZXFrdjloMHcyUUt6?=
 =?utf-8?B?ai9CU0MzQUlUS09lRmhSbjNMZDN4bEdYeTRRejFFT2VxRk01Z2JzejJyM2I0?=
 =?utf-8?B?dC85eUlLU3IvMVF2bkluQU1EK0o0Mjdma0Q3QkkvNC91dUNlUzFON1dFSDVR?=
 =?utf-8?B?dXF2QlFMVXpjSkU2bm9ubEp2dm9JWDF1QmFqOU1XYnBJaXhtRjFMVjVHTlV4?=
 =?utf-8?B?QnQyc1EvYlM3UkRtbC83VmYxdFNxdHBHU0phYVhESUdmZStrRlk4YzMxYUt6?=
 =?utf-8?B?cnhmTktsb0t3Q0FxUEd4bFArNUhsY3A0Rm5STVdOZWdxZktqOTlNRGw0WWhQ?=
 =?utf-8?B?VzVsWkthS3laV3RoalZFUnJuK3lxS3dPT2VMc2NvNVF0eW8xemhZUWxiN3N5?=
 =?utf-8?B?QjVTeTRJaGNyV3IvVEd4YXZhSDI4VjQrU2MrY0VsTXN3N0VrRVZBWXFzN05x?=
 =?utf-8?B?RmtVOTdsMWFYTm1iQ0RwS3p4MjFLUTJlYTAwN2VrZy95S21oM0NXKzZGTG1O?=
 =?utf-8?B?U00rWm1lUlJHUkpsQ2lxc0lXUjAyeW9ieWZiSWtUZGVvbEcxYWw4Q1Z4ZnRn?=
 =?utf-8?B?YUJoeWFuRzNMRW12WE05MXlkRjBGSEkwMXpQWnBaU2s2cHdFRXVUQ3UxRzEy?=
 =?utf-8?B?eE81cVEwbGR0eFVmNDVneXRBNTVPWnQxWVZCTlZCNmNtNmJkYmJIeVdPc2Z2?=
 =?utf-8?Q?YIZB583zs3vyZByRMCVffRc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: be420722-6277-4482-66d2-08dd475c6927
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:47:18.4506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3TtcMzWTkbFA952zwWpGgMgs7THuWEKuMTFIs9nFS+w5Lc7epp16M60NME1QljIWxuM+eJPcd4fxWd4LmduyGTUaR3esjnhzlH5aO3Oezc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7334
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:47:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6289

Hi Antonin,

On 2/7/25 10:35 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Feb 7, 2025 at 10:26 AM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 2/7/25 10:09 AM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Wed Feb 5, 2025 at 3:02 PM CET, Quentin Schulz wrote:
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> b4[1] is a very nice tool for mail-based contribution. A config[2] file
>>>> exists to set up a few defaults. We can use it to set the To recipients
>>>> to always add, in our case the mailing list.
>>>>
>>>> Because we do not have anything to check for now, disable needs-checking
>>>> so patches can be sent without running b4 prep --check.
>>>>
>>>> Because we do not have any auto-to-cc support (and the implicit one
>>>> using scripts/get_maintainer.pl cannot work for us), also disable
>>>> needs-auto-to-cc so patches can be sent without running b4 prep
>>>> --auto-to-cc.
>>>>
>>>> [1] https://pypi.org/project/b4/
>>>> [2] https://b4.docs.kernel.org/en/latest/config.html
>>>>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> ---
>>>> I'm wondering if we couldn't add some per-patch check as well, checking
>>>> that the documentation builds for each for example. Could be added in a
>>>> later patch though. Any idea?
>>>
>>> I think this is a good idea although I think it would make more sense to build
>>> the tip commit only, as doc builds are a bit long? Don't know if this is
>>
>> Ideally individual patches shouldn't break builds so that bisectability
>> is guaranteed.
>>
>> At the same time, prep-perpatch-check-cmd currently runs sequentially
>> and Sphinx caches stuff between builds... so probably the first run
>> would be the longest and subsequent ones would benefit from the cache
>> (if we reuse the build output from previous patches).
>>
>>> possible with b4, though.
>>>
>>
>> Not yet, see
>> https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/ez.py#n1683
>>
>> Konstantin is typically the only one really working on that, so I'm sure
>> he would appreciate some patches :)
>>
>> At the same time, I've done some shady stuff with b4 for poky where I
>> check (rather **guess**) if the current patch is the last patch in a
>> series. c.f.
>> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper-poky.py#n44
>>
>>> In any case we might also use your container scripts for this (which I will get
>>> to soon hopefully!).
>>>
>>
>> That itself may be adding a lot of time to the test since we need to
>> compile the container first. Additionally, remember that absolutely NO
>> message should be output to stdout or stderr by the script otherwise the
>> check is understood as a fail. I'm wondering if we couldn't add support
>> for a PIPE between b4 and the scripts so that we can ask it to print
>> stuff (e.g. "please be patient, this may take a while" and maybe even
>> print some progress). For example, I briefly added some WIP support for
>> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time
>> before returning something, not very user-friendly :/
> 
> Ok, all of that sounds like we could already have a first version of this
> scripts that just builds the doc locally (no container), commit-per-commit.
> 
> Also, is there an option to opt out of this easily? I wouldn't want to
> discourage people to contribute because they are unable to setup the docs build,
> if you see what I mean (even though I really encourage them to do so, this saves
> me time).
> 

If you don't run b4 prep --check before b4 send, you'll be told you 
should be running it but you can still ignore it and send the patch series.

This message isn't printed (or at least that's the intent) if 
prep-pre-flight-checks has disable-needs-checking in it. But then people 
may not be aware that they have the ability to run this check before 
sending the patches.

> Random idea, but the script could read an env variable that switches to a
> container build rather than a local build. So the default behavior is build to
> build locally but we could always opt out of it. In any case, I would appreciate

The script should not output to stderr/stdout if the check isn't a fail. 
Outside of this limitation, it's just an executable started by b4, so we 
can pretty much do whatever we want.

Which distro do we want to use by default if OCI build is selected?
Do we want to allow the user to provide their own Make targets for the 
check (e.g. not use publish, but html, or something like that).

Also, I think we should use a temporary build directory for b4 prep 
--check so that it doesn't reuse the local build directory which may 
already be modified by the user, e.g. for debugging purposes.

Cheers,
Quentin

