Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB40E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 13:48:59 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.64])
 by mx.groups.io with SMTP id smtpd.web11.10748.1733838530030841804
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 05:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=c8xEqs3T;
 spf=pass (domain: cherry.de, ip: 40.107.105.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xENiJ8Uvq6MVHdkYSCUkX39rkpQ/yWGYkXmkM0D0srCcll5S4hg91JOIZXqeq/jmFaCbase2NuBIyzDgNjDDj8SHHGTZ9J+cNjLWJcD3vGPuRHMGJ+KlUFUjRZ69tNu1c3x3I26iMeFWTd+SJSHxLY9NnE62VJtRAJOy6FNah9xAwInzqHI8Q6yX0IJncx2juke45i4UjshWS0mXp8mwm7KQgi+2jhqw5ceqr45YieNxu5yi2LHqrPSHior2rHrn7Rh1Ix6ZdMJjeFJ6AL89Xl0/A2a41PNK2SoWcg5I1JH1AkovEESliP1uvPrycB5G1CXcy6bhdx8gYmpx53A4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRJgpdymRNXQxw1g5/RCZ6RNACMTzYZ7vKXEKheGUxU=;
 b=bGWEFIAPT8Gk82nrzrOFraHKyBWjQ3yvMIDYQV7oHW36xZo1BEYZkck5nxo+7Qz3keua7pg5I64r5/kVW/MEKNlkUyRZ/Kz/ulFiPU3GcRFROEg3ZOo6jiYcPESfxHcMmTB1hDh+jEd98dC9YvzJDb5h/kLO7v/5KkDU+nLr946Gkzyj9OoXeoH76vK32ZdXRoVPgt11VCwKrEdLltTLOh3bxvBT1u2bDj+C3xrOwP+xmWtsz11EDSr+Ckf5T442Kw+nxx7XG2wBGiDxKqDiL+WUHU8bBuXHNTBXe8WF+JGd4s5dxjWEfw/9UYLeQYo/PWYSEUKdzAnAbQ5eZHiciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRJgpdymRNXQxw1g5/RCZ6RNACMTzYZ7vKXEKheGUxU=;
 b=c8xEqs3TaAAUOKyHebBayrivtz2cTOhZ9uvhGWZsw8wLjlaWq4hfD0AzNbM9W3KwlwadE1c4GpebaBlfQzJJZYPGjA8L209Sf3wOeKTKKJwMW7L0AfKMnLaIF5Mvo1mIeelS1RgNXKHaZP9gVqHnMtgOC3epblFVnpzY5l9uno0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10214.eurprd04.prod.outlook.com (2603:10a6:102:404::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 13:48:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 13:48:45 +0000
Message-ID: <2e420969-02db-4116-ac99-38332a3d4b40@cherry.de>
Date: Tue, 10 Dec 2024 14:48:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH v2] Add scripts to build the docs in
 containers
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com>
 <fd8bce6e-155f-4c95-8061-bfef0d5784dc@cherry.de>
 <D67YBBAMD627.3JPAXWB92MIQ9@bootlin.com>
 <85b846b7-09ec-49dc-b739-813d52dffb81@cherry.de>
 <D6814L7Y2U7C.1PWWUILXKF7H3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6814L7Y2U7C.1PWWUILXKF7H3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10214:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0c5e8c-f3f2-4801-665a-08dd19215dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0VEMmxvWUJza1hCbXVZeFlCamhJSXZYSFJkUkFlRFN5aUhuNTlveVQyVTd1?=
 =?utf-8?B?REVqMFQ5eEltS3pqditiT0FQRmc1b0V0MXRpT09zRG5uTkgyUXNUcTlselRY?=
 =?utf-8?B?bHA3c0ZOVjN2ZG5QMld2c0ZNSlp6TVBlM1pRdEtXNC8ybktZa3dGVlNlTVBS?=
 =?utf-8?B?cjkyc040eEpZQVJaZVRaanNVRVNXeUFQbHFzVlhvdVhsOEhqVkFXOVEzeGZK?=
 =?utf-8?B?ZHo2OUZRZFY0dSt1NGpEc00wY1BZVmpWV0N5cE9yZE1hVFI0dzd2TmVhSUlh?=
 =?utf-8?B?WjRrNi9pNTBPQ2JGM3NGRnBSeVBubnIrNWtmRWs3M2NtOHBwOFAyL2s5ZStz?=
 =?utf-8?B?am5UVEhIWUxkUndzRFRqTlcxQzJXbmhxQWs1UXZxM243cnJab0xVc09VNndw?=
 =?utf-8?B?b05rRFkxYTJsNWZTQXhJZmx0N3JqcUlsYVVmLzVqRGNBMUZxWGF3alNDYVZJ?=
 =?utf-8?B?SkpPbkFWeFNvTDBsWElWSS9rRUhXaitHcWlHYjArdWdheTRKNEhOclNHSk5S?=
 =?utf-8?B?bWdoK1g2bEdsSVZZaldWNkNOZUN0UWZQWjhuQllONkJPUUpnQWZIeXhvMyti?=
 =?utf-8?B?dzRPdXRGUThhbStPS1cxZGR2MHFrQ1QxRU9PSWdXWjc0cldKQmRVN2Q1Q1ZB?=
 =?utf-8?B?bmJHd3EyOEU5Uk1aVmhiemlKTDZCUVBpMklQWEo5WDFrRkJNM3NxTFR6SjhY?=
 =?utf-8?B?ZWkwZW5POTVWVko1QUthd1F1dzNHMVRFalpFUlJVVVU5N0VPTHUrSzArQ3hw?=
 =?utf-8?B?SHVtblFTME90L1dsRDJ4RHh3VGw4MEFWUks1dXBCallPUDZWL0ErdG15UXpj?=
 =?utf-8?B?czc5YmFOK3NnT0NlWXhjNjZFdkpNWXR5Y1BnSGNKSExJOEhRSDVtenQ4bXNF?=
 =?utf-8?B?dnJnQVZ1b0RPNWhob1UzVVg4OWFvUDN0MWtWVm52WldVY0hvOSt5V0RIQ3Bq?=
 =?utf-8?B?Z3FGOTh1ZjRzRGhwQXhzdWJtSEt2aUpmMzQ1OHZNWGhhQnU0Rm9CRzZGNnpE?=
 =?utf-8?B?MVlTL2FCbktoUExONXNrVjdiTnpyTkhicUJXSDEvOXdrY3A1dGtqaTg1bDh2?=
 =?utf-8?B?MzZEMXJkdDRWSDdZSkFkM0JtMEI3ejdyTGljOWduZWhSc01VanhUMTc0MDFG?=
 =?utf-8?B?a1hPYmZBNmZNUGFQWThsN2VBeFF3SVhjbGVBVDdkSHFZQzZvRzQ3d2pDeHpz?=
 =?utf-8?B?SzE2ODdybnN5bXUrOHpLYktiVUNGRm0xZnN2ZVVyaXp5c2JjVUxyWXMwQ21J?=
 =?utf-8?B?ZlhTUU9uL1psWFlUdjdRUVg0WndQL2ZDVDRsdWZNS3NXUTJ3Mzk1d3RZaVVD?=
 =?utf-8?B?L3B5U00rMmk4MWJ3VjNraUNkZzR0R2NKV0xPcmVBZ0VsenJ6d2pFZ3VEOS9G?=
 =?utf-8?B?MC9RSm5ROVZCQXFZdEtuZjk3dG5MZTBKY1dya0s0ejJmVE1nQTNxbTBKYlpC?=
 =?utf-8?B?d2VWclBZNnlVSTREWGI0cStheVIxWmRNUHhIVS9pcXAzeWNWbWV1NUszZEV2?=
 =?utf-8?B?RkwrUUhLdmorUGphRTMvQmpHeCtaMGVEaUtudEFEZmtuc05YYiszbXB1Z3Ny?=
 =?utf-8?B?ZmR5djJrQmRBYWxTLzFBdERFV3V2S2d3Y0RoQ0E4c0puU3Bia21iVDNTNVc2?=
 =?utf-8?B?aUhVY3UwY3FpYU1QUEd1b2NkVkVLczJPdWl1TGhjUW1uZXJUQXJpdXp5Z3Nt?=
 =?utf-8?B?SFNtbzhmMVJ3TGlHRlpiWUZIOEJaRlgySTdwNld6MWIyTmhCNHRRSkxIZjhG?=
 =?utf-8?B?V3V0SEtBSU81OHI5elRxQ1VHcjRmaWEvNTZIWnhZQlRGUGZycnlDZmlncnEy?=
 =?utf-8?Q?EWQHVKDEOYjfUe5DSBUKrbtPh74fsNcCM/h5k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blZkNVlWdCtaN256em5yMXdRSVFOY0VMV3RwdTc4ZUpnNkxTNFhPT0NDRjh6?=
 =?utf-8?B?Q2tRNmdaZzY5NldpdzErem95S0x4SHVjQitHeXpvb3ZyV1NOcGtlZkVrN2pk?=
 =?utf-8?B?UlEwQXpCZXFGeHpocVpCbERWaDdLODZycG82a1V5UU9adXljbHpHMlVUU3FR?=
 =?utf-8?B?MTltM2V1L2VpSXNFeCtyTjlXVzBGQ1pieWdCN2xrOVFZN0VlSlBYV09VVmw5?=
 =?utf-8?B?VURVR3VwQzdlZnkxU2ZhelVQakMrdTdrZlQ3bGhBZExDbDZxVEk0VUVIekRG?=
 =?utf-8?B?VTFZYW5ndUpsQk5yT1l4eHJvWW9DWlFWUVh3YURTQ3Ryb3krZG0zdnVwUFdQ?=
 =?utf-8?B?R25SV3NlNU5TODE1d1lYMUwvQ2V3bldlTkI2OWRxSjhxMm9VMGVxYzgwRC8v?=
 =?utf-8?B?d3I4aVVtcFlPeVZ5N2l4anZBNGVPTXFVM0hrbjBKWnBFcG40cGtkNjFmR0k5?=
 =?utf-8?B?QlAzZ3FNd1ZGamNST0I4WXVRZEJmellLcGxHSTlVbzRhQUZlTTg0aUhJQjhU?=
 =?utf-8?B?T3F3eW9DOWJ5UUhDTXFERElzTm1iUjlNcXRRdDZZTzBWaSsxcG1WV01wUzZX?=
 =?utf-8?B?MFVlbDk4VWNRUjc5ZzJ6a05rMFo4RlNwclZzYnV2RHRuLzBDYUZnMWVodGt6?=
 =?utf-8?B?b3IwWWI0dmkwOVNubzRPRFpkd3B3OE1qTkN0NzAwUytVcWNBZWQwSnlvUGFl?=
 =?utf-8?B?QVdIdWJCcitLbWp4SHFoY1Y4VUlBWUJmZ3lJVXJzNU5QUWlGQmRBRGhJdlpi?=
 =?utf-8?B?Q2x0Unk5ak5BUS90MVZpR0FONTEyTU5VemVnc00vMi8wZ2ZyTDBCS0hlanVv?=
 =?utf-8?B?dmt0T1ljbWFQOHB6Q1JSbEh3Qmx0d3k4cU1sZUw3b0xCR3kxbjVBeVIvajJB?=
 =?utf-8?B?RnNJMUZxNUp6YkJoVjVYakRsM3d2eFY4N2dkU2NzZHZoV2l0U0JadGRDdHdG?=
 =?utf-8?B?Z09KdUFqOXpTendBdlNwcFp0T1AxOW1uUmVHbGhEbkhQRUZ3NnFxYzBUdW5R?=
 =?utf-8?B?d2hHRWVUeUJPcFVCZzhsWUFhSnlzUWcvcjA4Q2xITlhsNXZrVHV4aHNFc05Q?=
 =?utf-8?B?andXZ2c0Q3RuS2xxVXpwbjdXY0JSYlZoQVE1T3RTK01WNFNja2dsbTVMdmo2?=
 =?utf-8?B?ajJaTms0VDZOTll0UHV1d21CcU9kMWZDOWJpaURrTmtvckhiaHZlUUZHZjFj?=
 =?utf-8?B?T2pLZWpHZjVaV2lPcmlkdTFoS2VtS3hNNVlSVGFuT3A0a0h3Mm5rcTZ4L0Fm?=
 =?utf-8?B?dVQyVmd4ZitlT1d0a0VIK1NKdk1hN3VqaldGTVFhbWZUcHZ1QzJrcmgrRmJy?=
 =?utf-8?B?bEttWWF0cnhGTGxlQ1VMNjFNMjRpT0dNbVJkSERnZ2k1MnBBeTB1NXBKczhy?=
 =?utf-8?B?MWRoYUNmTmhINTE0eFhySmlVUGJtRnNLZVE4eVBDNHFMM05hUlM1R2xoQ3NE?=
 =?utf-8?B?NEFwd1lzbmw3WkhTeWowWmxYWW1mMUNJUHVuV0NrWEtIZUxHb3NVaW5sZHFX?=
 =?utf-8?B?c1h0c3RpUi9IZHVseEJhQUgxOEJnK3ZtZHUvL2UrYlo3QTgrSWcrVDlqVEk5?=
 =?utf-8?B?ZUVTTlRScXRZYVFQM2FnNTlEdGszR00rcnl6LzZmelFXeTJBV0hINTRYZll6?=
 =?utf-8?B?bVFodEw3YmtXQ3FGYnVyVWsyOTBaY3hrWFZDVkVaZDlOV3Rra0lFOXRreklC?=
 =?utf-8?B?NXdTNmFRakVZaWxVRjFsOUNiZzNwSlBGeGR2VFk2Q2FLM1NIV1hQNzNadW1P?=
 =?utf-8?B?ek43ejNBaDNSMDEwNm1Pa1g3ZmlheWs1NHA5NDdpdFRYVUg5WDBNajBOWlNl?=
 =?utf-8?B?Q2VVN282d2lHSzdENFQzZEFhempHbjJnSWJmVmw0VXVQazZ3dm41SmxGK2NE?=
 =?utf-8?B?d2tDMTVVV0lBelozTFZoS0QyQjlHRHUxTlBWOUlSb0VqMEVMZFEzVDJsWlJw?=
 =?utf-8?B?YzFCbUlLY3ZxYXpjbUpybVZXRTlmR1ZLbUVZUjUwdkJHL3JobGV3dlNHVG1j?=
 =?utf-8?B?eTNXVkVkT01vemIzV2xUSUpzVnkyUURSZmZqZ2l3d1JXb0VJZUd2dDBKR0RI?=
 =?utf-8?B?LzBWaldjUkR5bWp0Ynk4T29ZaFE0a2UzNEhoODAyVThzYk9waUlsM2d6WDhm?=
 =?utf-8?B?RStpTTlUakc5c2dzZTBIMTFKY2FhcTJTK3ZaN2JpWTZHYmJSQXJES2NjQ0c4?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0c5e8c-f3f2-4801-665a-08dd19215dbc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 13:48:45.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +69Y7f0JowCpzDVHvldttMSKza6G807JlGPNvTlDjuMyLra9WIhuIH12FkVBs80SrE3h2oPvk7N1Z2mwhUTMKroHjnSbIuNLJmPoICsSut8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10214
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 13:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5922

Hi Antonin,

On 12/10/24 1:46 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Dec 10, 2024 at 12:08 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 12/10/24 11:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Hi Quentin,
>>>
>>> On Fri Dec 6, 2024 at 3:23 PM CET, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 12/5/24 12:06 PM, Antonin Godard wrote:
>>>>> Add two scripts for building a container image and building the
>>>>> documentation in that image: build-docs-container and
>>>>> container-build-docs.
>>>>>
>>>>
>>>> Yet there's only one left now :) (also in your commit title).
>>>
>>> Oops, will update in v3 :)
>>>
>>>>> For now, the documentation/tools/dockerfiles directory contains a
>>>>> Dockerfile for building with Ubuntu or Debian, but we could extend this
>>>>> to the supported distros.
>>>>>
>>>>> It should be possible to build the full documentation with two commands:
>>>>>
>>>>>      ./documentation/tools/build-docs-container ubuntu:24.04
>>>>>
>>>>> CONTAINERCMD can be replaced by "podman" to build with podman.
>>>>>
>>>>
>>>> I assume installing podman-docker package could help with that too. Not
>>>> sure it's recommended, but I do have it installed :)
>>>
>>> Didn't know about that one. But it shouldn't be required to use podman or docker
>>> independently I think?
>>>
>>
>> It's just that when you run `which docker` you would get podman. But we
>> shouldn't require the user to install podman-docker for the script to
>> work. Just wanted to mention it.
>>
>> [...]
>>
>>>>> +SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
>>>>> +CONTAINERCMD=${CONTAINERCMD:-docker}
>>>>> +DOCS_DIR="$SCRIPT_DIR/../.."
>>>>> +POKY_YAML_IN="$SCRIPT_DIR/../poky.yaml.in"
>>>>> +
>>>>> +# This lists the different images we can build and the keys we pass to yq to
>>>>> +# find packages in poky.yaml.in.
>>>>> +# The keys should be in the form of "<image>:<version>", as this will be passed
>>>>> +# to FROM in the selected Dockerfile below.
>>>>> +# These are common yq keys used for multiple distros.
>>>>> +_UBUNTU_DEBIAN_YQ_KEYS=".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF"
>>>>> +declare -A YQ_KEYS=(
>>>>> +  [ubuntu:22.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
>>>>> +  [ubuntu:24.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
>>>>> +  [debian:12]="$_UBUNTU_DEBIAN_YQ_KEYS"
>>>>> +)
>>>>> +
>>>>> +# This lists the dockerfile to use for each of the distro listed in YQ_KEYS
>>>>> +# above. There should be a 1 to 1 match between the keys listed in YQ_KEYS above
>>>>> +# and the keys listed in DOCKERFILES below.
>>>>> +declare -A DOCKERFILES=(
>>>>> +  [ubuntu:22.04]="Dockerfile.ubuntu-debian"
>>>>> +  [ubuntu:24.04]="Dockerfile.ubuntu-debian"
>>>>> +  [debian:12]="Dockerfile.ubuntu-debian"
>>>>> +)
>>>>> +
>>>>> +main ()
>>>>> +{
>>>>> +  if [ "$#" -lt 1 ]; then
>>>>> +    echo "No image provided. Provide one of: ${!YQ_KEYS[*]}"
>>>>> +    exit 1
>>>>> +  elif [ "$1" = "list" ]; then
>>>>> +    echo -e "Available container images:\n\n${!YQ_KEYS[*]}"
>>>>> +    exit 0
>>>>> +  fi
>>>>> +
>>>>> +  local image="$1"
>>>>> +  shift
>>>>> +  local make_targets="${*:-publish}"
>>>>> +
>>>>> +  for cmd in $CONTAINERCMD yq; do
>>>>> +    if ! which "$cmd" >/dev/null 2>&1; then
>>>>> +      echo "The $cmd command was not found. Make sure you have $cmd installed."
>>>>> +      exit 1
>>>>> +    fi
>>>>> +  done
>>>>> +
>>>>> +  # Get the appropriate dockerfile from DOCKERFILES
>>>>> +  dockerfile="${DOCKERFILES[$image]}"
>>>>> +
>>>>> +  local temporary_dep_file="$SCRIPT_DIR/dockerfiles/deps"
>>>>> +  echo -n > "$temporary_dep_file" # empty the file
>>>>> +  for dep_key in ${YQ_KEYS[$image]}; do
>>>>> +    yq --raw-output --join-output "$dep_key" "$POKY_YAML_IN" >> "$temporary_dep_file"
>>>>> +    # add a white space after last element of yq command
>>>>> +    echo -n " " >> "$temporary_dep_file"
>>>>> +  done
>>>>> +
>>>>
>>>> Just use a temporary file, this would allow to run builds from two
>>>> different distros at the same time. mktemp should help you with that.
>>>
>>> The problem is that the source in COPY must be part of the build context, so I
>>> don't having a temp file in /tmp is possible. See
>>> https://docs.docker.com/reference/dockerfile/#adding-files-from-the-build-context
>>>
>>> I could use "mktemp --tmpdir=$SCRIPT_DIR/dockerfiles" but I don't really see the
>>> added value.
>>>
>>
>> "this would allow to run builds from two different distros at the same time"
>>
>> Also, it's guaranteed that an old file wouldn't be used in case the
>> script is somehow broken.
> 
> I see what you mean. However, since mktemp create a random name it creates a
> new layer each time, invalidating the following commands in the container file.
> 
> Instead I propose to move this above:
> 
>>>>> +  # docker build doesn't accept 2 colons, so "sanitize" the name
>>>>> +  local sanitized_dockername
>>>>> +  sanitized_dockername=$(echo "$image" | tr ':.' '-')
> 
> And do this:
> 
>    temporary_dep_file="$SCRIPT_DIR/dockerfiles/$sanitized_dockername.deps"
> 
> So we avoid the distro clash and we still use cached layers.
> 
>>>>> +
>>>>> +  $CONTAINERCMD build \
>>>>> +    --tag yocto-docs-$sanitized_dockername:latest \
>>>>> +    --build-arg ARG_FROM="$image" \
>>>>> +    --file "$SCRIPT_DIR/dockerfiles/$dockerfile" \
>>>>> +    "$SCRIPT_DIR/dockerfiles"
>>>>> +
>>>>> +  # We can remove the deps file, we no longer need it
>>>>> +  rm -f "$temporary_dep_file"
>>>>> +
>>>>> +  local -a args_run=(
>>>>> +    --rm
>>>>> +    --interactive
>>>>> +    --tty
>>>>> +    --volume="$DOCS_DIR:/docs:rw"
>>>>> +    --workdir=/docs
>>>>> +    --security-opt label=disable
>>>>> +  )
>>>>> +
>>>>> +  if [ "$CONTAINERCMD" = "docker" ]; then
>>>>> +    args_run+=(
>>>>> +      --user="$(id -u)":"$(id -g)"
>>>>> +    )
>>>>> +  elif [ "$CONTAINERCMD" = "podman" ]; then
>>>>> +    # we need net access to fetch bitbake terms
>>>>> +    args_run+=(
>>>>> +      --cap-add=NET_RAW
>>>>> +      --userns=keep-id
>>>>> +    )
>>>>> +  fi
>>>>> +
>>>>> +  $CONTAINERCMD run \
>>>>> +    "${args_run[@]}" \
>>>>> +    yocto-docs-$sanitized_dockername \
>>>>> +    make -C documentation $make_targets
>>>>> +}
>>>>> +
>>>>> +set -eu -o pipefail
>>>>> +
>>>>> +main "$@"
>>>>> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..3c543dc4b0e96dc9c00b201558e2ed00847339fa
>>>>> --- /dev/null
>>>>> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>>>> @@ -0,0 +1,18 @@
>>>>> +ARG ARG_FROM=debian:12 # default value to avoid warning
>>>>> +FROM $ARG_FROM
>>>>> +
>>>>> +ENV DEBIAN_FRONTEND=noninteractive
>>>>> +
>>>>> +# relative to the location of the dockerfile
>>>>> +COPY deps /deps
>>>>> +
>>>>> +RUN apt-get update \
>>>>> + && apt-get --yes --no-install-recommends install $(cat /deps) \
>>>>> + && apt-get --yes autoremove \
>>>>> + && apt-get clean \
>>>>> + && rm /deps
>>>>> +
>>>>> +RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
>>>>> +
>>>>> +RUN git config --global --add safe.directory /docs
>>>>> +
>>>>>
>>>>
>>>> So... I've had another idea.
>>>>
>>>> Parsing yaml in shell, not fun.
>>>>
>>>> But I don't think we **need** the instructions to be in the YAML file.
>>>>
>>>> So I think we could drastically simplify all this by storing the setup
>>>> instructions in shell scripts which are included in sphinx AND use those
>>>> shell scripts in the Containerfile. We actually do this for our product
>>>> user manuals :)
>>>>
>>>> Essentially, we would have:
>>>>
>>>> $ cat documentation/host-packages-ubuntu.sh
>>>> sudo apt install gawk wget git diffstat unzip texinfo gcc \ [...]
>>>>
>>>> In Sphinx:
>>>>
>>>> .. literalinclude:: 50.literalinclude.apt.sh
>>>>       :language: bash
>>>>
>>>> In the appropriate place.
>>>>
>>>> How we generate the Containerfile internally:
>>>> """
>>>> cat <<EOF > $WORKDIR/merged.sh
>>>> #!/bin/bash
>>>> set -eux
>>>> export DEBIAN_FRONTEND=noninteractive
>>>> apt-get update
>>>> apt-get -y install sudo
>>>> EOF
>>>>
>>>> # Merge bash snippets we want to run (in the right order)
>>>> cat ../source/50.literalinclude.{apt,atf,uboot,linux,debos-prepare,\
>>>> debos-build-bookworm}.sh >> $WORKDIR/merged.sh
>>>>
>>>> chmod +x $WORKDIR/merged.sh
>>>>
>>>> podman run --rm --tmpfs=/tmp -v=$WORKDIR:$WORKDIR --security-opt
>>>> label=disable \  --annotation -w $WORKDIR debian:bookworm ./merged.sh
>>>> """
>>>>
>>>> I assume we could simply use COPY in the Containerfile and include the
>>>> shell script in there and run the shell script in a single RUN. You
>>>> could then do the cleanup step in a separate layer, not optimal since
>>>> the layer will be unnecessarily big but I assume the end image is going
>>>> to be smaller anyway?
>>>>
>>>> The benefit is that you test **exactly** what's in the documentation.
>>>> And also you don't have to parse YAML. And it should be relatively easy
>>>> to add support for new distros.
>>>>
>>>> What do you think?
>>>
>>> I like this idea! Only downside I see is to have to re-run "apt get install" for
>>> each run command, which is not really ideal IMO. I prefer caching what's already
>>
>> No? I have one RUN command which is "execute this shell script".
>> Whatever is executed as part of this shell script is part of one layer.
>> You could even have one RUN command which is apt-get update &&
>> my-shell-script && apt-get cache remove whatever to make this a smaller
>> layer.
> 
> So let me know if I got this wrong, but running "podman run ..." multiple times
> is going to make use of a cached layer automagically? I.e. merged.sh is not
> re-run each time? Or you are implying that there is still a Containerfile in the
> process that caches this data?
> 

OK, so I actually didn't write what I was thinking about :)

To answer your question, podman run cannot cache what's running in there 
with the above command, so it's run every time. This is fine for our 
manual because we do want to run those commands every time and not rely 
on caching (e.g. because we build the HEAD of some git repo and that 
**is** desired).

But we could simply generate this merged.sh script before podman build 
and pass it inside the Containerfile so it makes it as a layer.

Obviously, any change to the shell script would trigger the COPY layer 
to change and everything after be rebuilt. So the cache will work until 
the shell script content (mtime actually I believe?) changes.

>>> been downloaded so we can re-build the doc swiftly (I imagined this script to be
>>> used for more than verifying that what we list in the dep list is enough to
>>> build, and used by anyone to test their changes to the docs easily).
>>>
>>
>> You can have as many scripts as you want? And have them do as many or
>> little things as you want, I'm not sure to follow what you have in mind
>> here?
> 
> That wasn't clear maybe. I simply meant to say that I want to publish this
> script not only for verifying that listed dependencies are correct, but also
> because it's convenient for anyone to build the documentation. It's unrelated to
> your solution.
> 

I'm working on something right now, will send as RFC so you can comment 
on it. Should happen today or tomorrow.

BTW, I'm unable to build the docs on openSUSE Leap 15.4/15.5/15.6. It 
seems it's always trying to build from python 3.6 and something breaks 
in the sphinx part very early:

0efb6adca777:/docs # make -C documentation/ html
make: Entering directory '/docs/documentation'
./set_versions.py
Traceback (most recent call last):
   File "./set_versions.py", line 102, in <module>
     subprocess.run(["git", "show", "yocto-%s" % 
release_series[activereleases[0]]], capture_output=True, check=True)
   File "/usr/lib64/python3.6/subprocess.py", line 423, in run
     with Popen(*popenargs, **kwargs) as process:
TypeError: __init__() got an unexpected keyword argument 'capture_output'
make: *** [Makefile:78: html] Error 1
make: Leaving directory '/docs/documentation'

Cheers,
Quentin

