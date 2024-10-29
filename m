Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E1D2AB1F
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 10:57:51 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.55])
 by mx.groups.io with SMTP id smtpd.web11.16400.1730199468542495005
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Oct 2024 03:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Vk4D4eAm;
 spf=pass (domain: cherry.de, ip: 40.107.249.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRCT9DtNduMzY31v8IzT+HlF+rX2XoXBzm8CZ648y0itwaML13tFFvjI4RyFy098ipU2WWoZw8ZVZRnyBnLBT3RyYl4BZ0wYj5ilwgTZComaf9pIiRlU2avy3LaAjsxWbiLC2eoD9yfwa7HwAvIlcL9bxEyEGOsYwRjTRuhoxeRdrdYLP/4vWxr4IqhRNUN9Zs4II/rP8BZOCru5D1CVrVTphWRjarZJlO5ee5ajN2nMb/wK0Lhp2tY1mKuI+T8b53O0KrJwN5rfQ45cffV/mh8ujfcu6PgJsTbn62TbOyzUkKi+ebrMFs1xcOFYbeD3i0/zEHWtUNAphU4XZMHtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+d0FWXoeaAHX5lnShMbqq2jXsY27dprV55zTAkTycI=;
 b=KIWQbTykVzaJDXllh1IZlie0DGNgIOgKHdlskoW7ZJkwk7/g9fFQbgqmUe87IfyO7CeicqrNHG03uos70wIgwsQCUTG6dGQEMej7XUY0nKrwQj2n/4c8RiYDq9zXaM5VIlSr597ffiEpeyJ2H0THOhgFPhrfY12CxulzW9s2Rwfz017igps7dU6ei1zIdQnypNVt60Bg/Hfdgw508IzDzVtQfA+sVyxPEwh9j09TrWYDr0j3J4Ppy7RPOfke12b+UljfZKU2nJOm7ZtV70Qv+FtgskXf7lXdE94MgOOGkvKkMX7rKWWje8JlnZZSrIwpy7zZqcLQBoKnhjuWCKLxmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+d0FWXoeaAHX5lnShMbqq2jXsY27dprV55zTAkTycI=;
 b=Vk4D4eAmQHSh+Gw3oyMFW5wOH8JrfnoxYOAFiv1+052fYYsVCGXgLFwqp3fvatOlv/ZAmA2dT8fAVxap6F0oUFz/r0tVzkZ3z0+zCgVlU6TSnIPpXg1pcWnVMOYEEBN+laZTgrafzmWlkpbxQPbnAECTgQnTps6hn15KDa7hmwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8686.eurprd04.prod.outlook.com (2603:10a6:102:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Tue, 29 Oct
 2024 10:57:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 10:57:44 +0000
Message-ID: <f2a380a0-6dd9-4d6e-9506-0d98d233ad06@cherry.de>
Date: Tue, 29 Oct 2024 11:57:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ref-manual: release-process: update releases.svg
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
 <20241023-update-releases-svg-v3-1-a8367b5d4854@bootlin.com>
 <04ae83df-db00-421b-9510-e246e8bc31b5@cherry.de>
 <D57HN7HBWZD2.3N3ZUTN2E6EFP@bootlin.com>
 <5540c8e7-9add-4646-92c4-e3068f5650f3@cherry.de>
 <D586LAX4M493.BOT4E8JLNCWP@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D586LAX4M493.BOT4E8JLNCWP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db6939c-ce30-4323-5977-08dcf808841c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUF2dGVldXovcDNkR0ZXdkc0MEpCZGdiUnZESlJDYnhzRCt2cUdmcS9aS0Fy?=
 =?utf-8?B?cm1LSjdrTHdNeW51WUVrMzYxNnRSWUdIQUtiSkh0c3o5YWJOOVZGUVloM1N1?=
 =?utf-8?B?RFhLQXBRWHM3UXl2TG4yam1lWTRVMlNVVmdLaGRVblRMSm9EMnhvQ2E5Z1NL?=
 =?utf-8?B?eWpDVlhpUHlCQ2d1TzVtemdwNmtTUkNjMVJVaWVUODJCQTZEV3JjK0liNXNv?=
 =?utf-8?B?VE8yVUd2M2dmdi91MUtIays2ZzRKWmsvdTN2Y3JzLzdPeDNpdGFnbUh0bXNo?=
 =?utf-8?B?MkNqdWlDNlhmcTlicEx4VmJNcUZNQis3SEpjREtwV0pQQnk3RkcvR1pycThE?=
 =?utf-8?B?UlpCVk9KdlFLbVlSU05pYnFGcWhUZkNreGs1L1FWZVQzUFBQOEFPb3RZVEVN?=
 =?utf-8?B?RWxQMWtWaGUvYjl5bWJtVjA4a2wwWWNSSWRrREZRVUw5akJtT09FLyt0bWxJ?=
 =?utf-8?B?ZjRpa0IwaDMyQytrZUxqUkNWOFU5UG5JUTNrdnZXWk93MnFmMVh0cU12MHFm?=
 =?utf-8?B?L0tRMldSV2lGTVdxRVA1dWlpMUxZZnFWbFF6MjJTOEtQTjFiQlVsemdRc1J4?=
 =?utf-8?B?V3J6TkhQUUx5ZU1ZNi9CYzlTTmxvMS9wREhlYTl0bEdUSmlBZkdiVm1QUlZC?=
 =?utf-8?B?QzZCbDd2RXgyZkxDQ1ZOU1RZL3NJa1FzQTViVkQ3bDlROGxaM2liYzRrOWFa?=
 =?utf-8?B?d29MSWZnZ1U1WlB5OVFEb3Z3Y3dCamtsdlkxUFZqdVBYd2lmdG0rZlFzMnEy?=
 =?utf-8?B?ZU9ONU4yeklKaEtJOVBTbUdhc3N6RzZQekVJMjQxcXZabGMyeW5rVldvcS94?=
 =?utf-8?B?ZmRXSWNWOUhHOTVlWGJ2MFBjdU1ZaG9KZUczbjBqKzB0dTRIZ0Q0czR4UmVN?=
 =?utf-8?B?QmVQWWFVTnRlVDltdldQMlpxZzV1RUxxY2lUUzA3M2JsMzNTZUxoWnhSdFdE?=
 =?utf-8?B?dUdoQ29IY0ZVUHd2U2IyNi9MUlpmbmtwZU4wTmQ5V0NZNThGRUNWSUxPL2l0?=
 =?utf-8?B?WloreUpuMmxZZ21EUnBheERDNFRzMHE3YmROejRFR0FmUVI4Z25oZEhHcG9U?=
 =?utf-8?B?YVVRcnRwTFRKNFcrd0xCc0Q2cmJCWGV2KzZlMTY3WGxnbTErbnZ6aG5tYllx?=
 =?utf-8?B?RjlIaWVtcExRbElPS2pidXNDRGRPUjlsT01SYnVBNjVnNDRaUERrVXB5OWZ3?=
 =?utf-8?B?UzgrSHBuT3N3NkExUkRUU2g5R1NSSGhDSmlyS002LzQ0cGNJczZ4bWJBY09o?=
 =?utf-8?B?TW9Rb2FZYW11SFhjNkZhSlU3OFl3L3pzSTdiWjRqdWRydWJ5aXo1cEExOW1P?=
 =?utf-8?B?VjdmTjRJL3RmRS9EVERkbC85TTJOMVpHZHBYcUJoNlM5d282RjRNWFRvYzZm?=
 =?utf-8?B?eVNuYWpxNG5qM3dNeDhuVkRxR2tONVF6ZGttdlUxeUZOOFMvSlM3eGUrVXdj?=
 =?utf-8?B?a3VjL3Zyb0w5VXNMU21PTWJsQ1E5TzkzQVdKbEY1WUpxRVRrajNsNVdsQS96?=
 =?utf-8?B?U0tWYVZOVHI3bXpnVU1xemhWYzZhVmhjY1ZTWjl2dnhoMlB5elRkTmovRkFp?=
 =?utf-8?B?dlNPajdDMk9KSFVBcHR2Z3R5YlRqemIzU1Nnc0U0enZNdzZ2M0RXOWYwTGlU?=
 =?utf-8?B?V2trV3IzdzliOFVjS0s3eW5PQWdBb2tDNGIvS0hBTW9Oc0lOcTRVMndjK04w?=
 =?utf-8?Q?xlWjdqeHey/h4ZSmy1v4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alZsQlJHdjVETUxCbGhjdE9ETERFTkVCcjNVRGVOT2x4K3BCWDNBdDFmWHV5?=
 =?utf-8?B?UkNaN053dGYyZ0o3MHl4YjBUVk1RS2VPZENESWt4cHJBb3Q4elZpSEZpWk1r?=
 =?utf-8?B?dXl4cExaeXNGTUhYTlBkdjNpckEvbHhTRHFQbmNFWkw3VUEvYlloWmRMMmFW?=
 =?utf-8?B?d3VhOTVGcDljUjZDVlJ5SmgzVFdhV3NIL09pdWJlTmtWYTRQTS93cWlndW5V?=
 =?utf-8?B?ZFhlcXczRENkdWVWMmdpbzlGYVBnT3cyS3B2RlByTG9kN2gvbnZ1RjNLMTZT?=
 =?utf-8?B?Q0FvNktYR1Q4aGJiWTN3N3dTaHpQMmtuZEZISm5vL0FWL3JuTmVpYWJReDVF?=
 =?utf-8?B?NlpXamcxUmF6ck93U1Ntc1haZDk2TnNDTXhEOFZENmFrNEl4WklMNDBDUFRP?=
 =?utf-8?B?QmVMRGk4TUVzV1A1UUN4N01EbnBYeWQrcm5adE5XS1RBMGxnVHZsWkwvWVEr?=
 =?utf-8?B?SXlkdmpUZElmZkVKYzFPNitDUW9IblYwMW5KVlNyWEVjaVdGY0VIanJhZDNJ?=
 =?utf-8?B?M09HVDlYUjdtOEQvTXc3L2JDT2Y2QllZK3FFdEJncGlrQXBPUzhzRlNQaWtY?=
 =?utf-8?B?czJsaktHdUdWcjVlZGliUGVDRVlqbjVoaG1wV01KazUyOVBseVpoSlNIVmZj?=
 =?utf-8?B?ekhDbU9nZWdSWW80R281bG4zZXhWQ1NtWVNkanh0cC9IdlhWS1Boazhhd0dp?=
 =?utf-8?B?M2h1WnlydUpnU1d5c3R4STZhbnlxTURXTnJHVEpHNjd1VHIwSTQ3NW4rR2Yz?=
 =?utf-8?B?bDM3aEVPbmYzczBlUlJvOFBJR0pHRkF5b0dMM0djQm1xS2ErN0pIZWZXNGYx?=
 =?utf-8?B?aVJDV3pXbEZJMUREc3J0STdOa2Jpa3F1QXlLeXF4Z2lUdC9tWmlNazMrcTVu?=
 =?utf-8?B?R0pvb0kzcWRtd3owTlh5amtiZThZaFFGOWhNSnoxemx0emgydGZOV1RNMUZT?=
 =?utf-8?B?LzNRMVdWSlRSbTdMbnY1elVCOGUxdThtZVI2Q21sNjdDenZGMGlWYURuQ3Vo?=
 =?utf-8?B?RVpVbEpBM0hsSXloT0NGL1FrT0tIQ3RXZ2dkc3FiN3RDVzhaMTV2VkIwQUg0?=
 =?utf-8?B?Z3FRU0QvOHRFSHFxQlc2VlYycHVrSFRVNEQ4ZGhqSERXcm1CQ3owdWRUSXZi?=
 =?utf-8?B?VkE1R0FkTERGdGJsNGp2Rk56ZEtTRlJqZ2dwU3FwVEljaUlVc2R0VXp4Vm5l?=
 =?utf-8?B?UGl1S3V6dnN4NUtCL0ltV0FLZ3FQWXFLamtqamVwZlpyMzdERFcrV1lrekVT?=
 =?utf-8?B?UWV0QVVEVHRjMjgxSTlRd2VjeWQwMjI3RnErdmFqdkhna1djRS9UelJzeWJm?=
 =?utf-8?B?TnpQU3VjOHh2SjkrN3dDRUpmaHZTTy8waElhOEhEOGw3M1BpWjl3OC9XbzNI?=
 =?utf-8?B?eGxJZi84SzBiWDlIbktzZTRjRG5FTWNaN2xkK2RkVWdGNlhBdWRDT1lYWm1G?=
 =?utf-8?B?REVLQ01FcTM4WUhHM2dNZVlxb1BEeFN6OVpUWWpPczFMdzNTdDZCRmlVSVc5?=
 =?utf-8?B?VnVKUC9GY013TEc3UUh4enBXT3VxNjV4VDViZ0ErdzRjNXQyb2Fzb0llejRG?=
 =?utf-8?B?V2hwVS9VMUQxRXduZzl3TnhDb0lVOFdEalJKUy9Od1ZWckNxb0R6bjZVeGNF?=
 =?utf-8?B?dHpWN1hDb0pVT2tQSGM1dC9FME1EUldSaVVLQ0NDQU5KaWVEN0dFOE5MMDJL?=
 =?utf-8?B?cFZrQWVIc2p3WDBFclR3N3pvdE9MeklCWXFjelFYWVp2ckNNYW1RcStkZ2d6?=
 =?utf-8?B?eTlZWFdnWG1KaUdsVFQxRENSbzFtNFpVaG5LS1U2eVJaL2piN09VVlpRL0FJ?=
 =?utf-8?B?SmhwbFN3VFlsN3RPSlZBclRpSFM5dm9IVVBqR0RQbW1ObGVUTWZaWTM3RU93?=
 =?utf-8?B?dExBNE9idzNKREorb3ZKNmphV2dndDhBdUVlSGZwejNjcVlHN1JkVjlUWEpj?=
 =?utf-8?B?dDJLbzlNWEEwQlIzeTB6eXZpc01qMkE0ZFdhWDdlMDZOUVNXRmE0K1F4cHZN?=
 =?utf-8?B?N1FHVk5YUGRpMVdGUS9vOTFPUWR6VjJ0dDk4NGpKTzVoQzN0eEZhdEFJNThI?=
 =?utf-8?B?YUg3ZmR0RHEwNUdELzNTaFhSUHpjejFmc2dPTDg1aXQrZDZJdWF3QmY3QWd0?=
 =?utf-8?B?aGhrdHVEa3RzZkllcFhtcWYySFZEalpoREMyMzRpdyswUWthTnF4TlpHZGVR?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db6939c-ce30-4323-5977-08dcf808841c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 10:57:44.1691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXjc93Bo+7jp/4YeUS6gY0KRLuO1xnJNeQZ4B6bd449LVyUrmyYvG9pwXMXDlT0n6HbGCjA9zJV83omShFw+EdmbWk13ARVQh/IL7w9s1D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8686
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Oct 2024 10:57:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5607

Hi Antonin,

On 10/29/24 10:26 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Mon Oct 28, 2024 at 3:33 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 10/28/24 2:53 PM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Mon Oct 28, 2024 at 11:40 AM CET, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 10/23/24 9:32 AM, Antonin Godard wrote:
>>>>> * Add Walnascar release.
>>>>> * Remove dunfell, gatesgarth, hardknott, honister: these release are not
>>>>>      supported anymore. Start from kirkstone, which is still supported.
>>>>>
>>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>>> ---
>>>>>     documentation/ref-manual/svg/releases.svg | 907 ++++++++++++------------------
>>>>>     1 file changed, 346 insertions(+), 561 deletions(-)
>>>>>
>>>>> diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
>>>>> index 036aa467cc2e646e99bc407bbf0ea7ff8825f57b..b1036e066ceb65a7391cec616cb4304094728f3f 100644
>>>>> --- a/documentation/ref-manual/svg/releases.svg
>>>>> +++ b/documentation/ref-manual/svg/releases.svg
>>>>> @@ -2,11 +2,14 @@
>>>> [...]
>>>>> +    <text
>>>>> +       xml:space="preserve"
>>>>> +       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
>>>>> +       x="1659.087"
>>>>> +       y="-3.6722763"
>>>>> +       id="text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2"><tspan
>>>>> +         sodipodi:role="line"
>>>>> +         x="1659.087"
>>>>> +         y="-3.6722763"
>>>>> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
>>>>> +         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current</tspan></text>
>>>>
>>>> This is a bit dangerous as "current" keeps its meaning while time
>>>> passes. So building docs from years ago from a tarball will still say
>>>> "current" event though it isn't really supported anymore. The X axis
>>>> showing the dates should be enough for people to get the idea, but maybe
>>>> we can also add the last update date of the SVG after Current? e.g.
>>>> "Current (Oct. 2024)"?
>>>
>>> I agree on adding the date after current would timestamp the image and make it
>>> valid for a given date. I like the idea of putting the current releases as the
>>> most prominent color, so I guess we can keep "Current" but add the timestamp?
>>>
>>
>> That's an option, yes.
>>
>>>> Additionally updating that SVG for all releases might be an issue. If we
>>>> backport it "too far" then the release of the docs will not even be in
>>>> that graph anymore, which is a bit odd. Moreover, the paragraph in the
>>>> LTS section may become outdated as well.
>>>
>>> I would have thought that EoL releases would receive a last update that puts the
>>> color of that release to the faded color, and then receive no updates to the
>>> diagram anymore.
>>>
>>
>> You would still have more recent releases in the graph, even though at
>> some point those also wouldn't be supported anymore.
>>
>>> Is it that bad that reading the doc for an old release shows a outdated
>>> "Current" state? Granted that they also show the timestamp mentioned above.
>>>
>>
>> I am of the opinion of yes. Imagine a user getting Yocto from a vendor
>> and the SVG that shows Current shows their release in there, which could
>> have been EoL for a while already. It's not uncommon to have questions
>> from people "stuck" on a very old release because of BSP layers from
>> vendors which do not care about updating.
>>
>>>> A random thought I just had was to maybe treat this the same way we do
>>>> with the migration manuals, that is to take the source from the last
>>>> release/master and inject it into all earlier releases whenever we build
>>>> the docs through the autobuilder. We could still have an outdated
>>>> version if people build it from an old tarball but there's no much we
>>>> can do about that sadly.
>>>>
>>>> What do you think?
>>>
>>> I guess that's the ideal solution, and it shouldn't be too hard to add too!
>>> (especially if code already exists for the migration manuals)
>>>
>>
>> It'll be a bit odd though because people looking at an old release and
>> the release won't appear in the graph.
> 
> While adding it dynamically to the svg may be too hard (or is it? it is a text
> file after all), we can still refer to the current release using the
> `&DISTRO_NAME` syntax, maybe in a sentence above the graph.
> 
>> There's no perfect solution that comes to mind right now though. Sooo,
>> best effort for now and trying to not confuse people is a good
>> compromise I think :)
> 
> So perhaps:
> 
> - Add a date stamp after "Current".
> - Automate the deployment of the svg file, like what's done for the migration
>    manuals.
> - Mention the documentation's release above the graph with &DISTRO_NAME.
> 

1) and 3) should be rather straightforward I hope. For 3) you could 
maybe just use Sphinx captions for example.

2) would need to happen in the autobuilder script for building the docs. 
If I remember correctly, I adapted the script so it can run locally too 
so you don't necessarily have to use the autobuilder. 
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-build. 
mmmmmm I think the supported release manuals entry is actually 
autogenerated by set_versions.py. I think you would want to add the svg 
(and the text somehow?) to this line 
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-build#n151 
?
It seems more involved than 1 and 3 for now so maybe more time consuming.

> Is the best we can do?
> 

It's a start for now, maybe we'll have more ideas in the future :)

Cheers,
Quentin

