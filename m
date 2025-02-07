Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32C3C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 11:35:11 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.81])
 by mx.groups.io with SMTP id smtpd.web10.67435.1738928110136966033
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 03:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gSUJwYIH;
 spf=pass (domain: cherry.de, ip: 40.107.105.81, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpxFKUO9K0cUTXO+uWGqyeCevGiDWFcnU0pE5ZQx/UBqJHTw2LqUT/Zsr+csswnlYOHAGfyCx2bOQywWA1/oncuko0Pu6KIissvc7AijqZ1G7+KVINJqisGRGmBtqiMwv5Qt53EjWRKS+6+0BvQbtJLb0lm4Dlp5JckoKml44Kb5hoqJhDAp0C0zk65nnXoV5PY/LMqSFRLAVNhxWMX7Jvafn8m5/vq5FA6C00y4VFoHOyLp/42+4L17IrUXy2a4Xn5TQ0LyexHlKNCNe2gPSFOuSYpZpcxIZyHr5PudnIRspadAKxbrNQS83Nn73Bhu/ONQD+Up3c41v4z64JGx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0niJPe4/nr4InxSJ2o50OUw0vjBQwlpOza/wBpUqws=;
 b=FMOpvmo55VL4udSjGe3fQabxjQn1lgJkFAJXlDv4xz2BK5PrPQg+ecCprLwnMBJfy1e4honYSmOAAfwaZzW2TFw6slFiaGzAgrcfc9mmMy4Z37wpJC2VunpJSU2dtGOViXNeyqqiNgAlQxpHUXDYY/CjojoaXCyEP3Qm1WilQp7Wyp5n2TAYqrHIpdj0Hmq7YRCUtkF1CM2Ukcf+/DYY8i2Q08M/QzgCKkqYmXePVH0t8SnRQIPATl0yUaWp8We/oZEk3wSGp7+Ut710aMMTv+U0PmcuR/IZd4Gu+A4KCy8K8FAASByQuVbo05cE1TZWy5gaI6/cMc4ek71ym9tmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0niJPe4/nr4InxSJ2o50OUw0vjBQwlpOza/wBpUqws=;
 b=gSUJwYIH4teqTNiD+aD/nQM+o07uvYrJ64ODxr5uTs2INXqIhy+xTcgEqBV1nAGueFs2kxzhnh0x2qH34603AtKX3ZbLLiXBp+MEElJnWb3D2yC33ihveAX1Pqnl00uBrSk1sZ9On61RISzGTQ5xXvw1UbUZF9KB7ubefdNgDvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 11:35:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 11:35:05 +0000
Message-ID: <6d6e092b-4f28-43b2-82b4-2e17edcab003@cherry.de>
Date: Fri, 7 Feb 2025 12:35:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] add basic b4 config file
To: Antonin Godard <antonin.godard@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
 <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
 <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
 <f404f281-6a3e-442d-b2f8-ca29940d0c3c@cherry.de>
 <D7M69TH319AM.QRQACZ44XTFN@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D7M69TH319AM.QRQACZ44XTFN@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR08CA0262.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::35) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab9f32f-4383-486c-fb27-08dd476b7787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bjY1dzN3VUFoWk9hWkFMaGcxbXoyZWxDSE56RXVRaGxNZnlNanRaVFNmdG5N?=
 =?utf-8?B?cllFTnJQY2ppdlM2MVBpNXNOV25zVmdLQkJva0pNc0FhQVVtWFIrd0crdzlv?=
 =?utf-8?B?WDE5Wm0vZytodDdwVWhpTE5Ld2J4UkxMMjJhQ3FLeExRNDVzajNEcGRheFFz?=
 =?utf-8?B?bFhDZ05WbkZQdUM2MDdpUWdqcXZKYkdCOXVSczBSR0JCcVZDaE53YXJhNDUv?=
 =?utf-8?B?anBIZHo1SWJNL3o0UmcxRWY5c2I0aTQrc0F0UVU0WXNHOUlCWk9JeS82bFRt?=
 =?utf-8?B?cTdXU3JNMHZJMS9lMFdMS3drZkpBUDMxZS94K2Z3bWVvMTdvQXhKV25ydFM5?=
 =?utf-8?B?cW9PbmxVQmViMnFYYUVYNnlNbjNGbzJMOHRhaXV3U1ZoUVBkRU9qOTh4RVdF?=
 =?utf-8?B?QlJFTzhtSVpQbmdldmVMRHFzN08wcFVWTlJQNmRoNmRYcTlXWitOeUVkQmRZ?=
 =?utf-8?B?Y1JlMU05UCt2UEhFL3pWSWtvL0h2UHhDNnVQWmNwR01sNnhkRDA2SEJGYStv?=
 =?utf-8?B?TlBJcHZkeFVkZENNemxzV2JUSHRBWE9PK2RzdkkxN0Jhc0ExOHd4TXBaa3FK?=
 =?utf-8?B?L0hEcTZaNSswVVluQjRDc0tDMndPU2lTRklrVC9za2x3YnBxV1NCbW4vUGVX?=
 =?utf-8?B?MzM1VUoyNDA4RlZkWmhwNGZ3N29pYUpjUnZVVy9ub2p2elIzT2o5bTZXQlFR?=
 =?utf-8?B?RDlOT0VzRHQ5ZWt5eTg1Q2tnc3U2MFVTbVhKNk5JYU1QNDRvNFFZSlhuOElN?=
 =?utf-8?B?ak5IWEdXa3VpVDgvM0RVNGRHT0x5NzI0MmdmTkxSbFphRXdMMW1JSHVUdnJq?=
 =?utf-8?B?djBoZ0hJVzR6ZzFQdU0xSC9pb3BKRUlqQ00zcFIxQVNjK2xta0lmc21neXQ4?=
 =?utf-8?B?ZWlPcmZ5UnJXZGpJNkR5OHhaQm42STFYK0RObE1ma21jQ0tIQXFVS29sSCtG?=
 =?utf-8?B?NzMrYitoSWFwNkhvOGJSeFA4cEVtclZtWHFBUGo0aVRmczFkUjVtank1eGdX?=
 =?utf-8?B?Ym5NVkZiTCtIcUVrUHdPOG1yQWlYODFZMjdYSVlQZ2d1S1ZndFgwbFh0UmZm?=
 =?utf-8?B?TlhMQXBwRTNKRkZiRnBSWkwzWEQxSDZ1NERrRzNkVndkY2Q1ak0xRzM2WmEy?=
 =?utf-8?B?dUh6ZEhVVlcrVytjUEpvTjBXbElxcmxoRGhuNWp4N0M1VDBpT0tuRmZ2VmJh?=
 =?utf-8?B?bi8xVS9raG1nMys5cWtHaGJndlBCUDZmZGJPc0xtb051Q3dvbDRoVWVoaThi?=
 =?utf-8?B?UElQSWFIakt5QStPSFA3eVZvYkNDdUJQeW5wUlh0VGRsaFJpRFJQYmsrMUQz?=
 =?utf-8?B?QlNZMHh2MEJRenBTY0ZFdllac1RFT3dLeXMxbGRLT0ZlNmcvK1M4ZkpHUFhl?=
 =?utf-8?B?aWswRzlJTGJJU1Q0emNxRWRQQ0tFL1FaRThrSEE1MGh1Ykt6YjdQZmpmd2pS?=
 =?utf-8?B?Ym4vVXdneXZGUFdmMmR6N2syemZhRXBIU25NWkJLb041MVhONWVEd3JZTU0r?=
 =?utf-8?B?WEpUKys3eFFoaHl6b3EyUXhYWFlCbjRhSjM0VnVnWURuOWxFZDBlY3puRlJl?=
 =?utf-8?B?akRLU1hHZTF5a3cxTGtzRy9WSWR4eEluRlN3OEZEbEZPakJIZ3FBWkpyL2ph?=
 =?utf-8?B?QmlTbEdJenFXOFk5ZDBLOWc2akFWQ0lyS0xBOG9hUUhHay9jVjRmQ3B6Y3l4?=
 =?utf-8?B?N2w0WjFXVDMyYkhMN2orQVFhZVFtVEJLcGFoQ3AwbllpSGxsQ0VWNTRPZTdw?=
 =?utf-8?B?cm8zb2NlVjZrZXh2K25UQm9oSDBlU2NoWXg5dUR6aWNkMXFKc1B6RXZJWUFC?=
 =?utf-8?B?NlE3VUt5SWdNZU5XWUZrZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWZGK2dkV3U4M0xyUHdydEZIVzdKTWxBQlNNaFFySThEY2REZHVneFJxVVRp?=
 =?utf-8?B?N2FLSVFudlN0R2ovazlqc0UzS0lCV3ZtNTNESUJWaTVXUGo4dDFlT2hXY1Rx?=
 =?utf-8?B?bVoxV24waGdUNW41M1VaTldvT2hoL2dYeDFQVU9aait1TGFWK0JYa3JWQ2x0?=
 =?utf-8?B?Z2VaRHBQdFM3REZhSytLcUVieFdGbFczQzFjTGlHQ1F1bmZJQ0VSYzJoWlpP?=
 =?utf-8?B?eitTOUpoMFRIWUJRK0tIbWhUYTNnZVNxUVB5M2lzYmtrZlN3ZGdCZGFpRUxN?=
 =?utf-8?B?WTRtTkpZQVhzbFdKZlVMNWN4VE0xNEJobkp1Vjl2Zis5NlIxM3orUnVlUlJK?=
 =?utf-8?B?Z0ZtY2l3Y0h6ejE5dUxmSUhIbk9SMXJ4YmxHZkQ1SGxHK3U3UVVsNm5qckJZ?=
 =?utf-8?B?YTdrL3dBcGFMY0g2b1hPck1rOVZIWWQrVis5MzZJb3NkQUZXU28rVGJ2SXBE?=
 =?utf-8?B?dEJlYUtrVVRvQlQ3UlVkcTZNaHFuODZDUlNudHBTR0padHY4bTV5Y0RCZ2RX?=
 =?utf-8?B?WUIyUXhzTi9mS0VVbjhJa21vdFRndE1qN1hvWWpZazR6TG4rcndGMWVEeGlt?=
 =?utf-8?B?VnNlRGtKQjgzYiszV0EwTFo3cTZCWE9VSUdUQWx2QUpTTVhtWXVaYVpCNjdm?=
 =?utf-8?B?N2d1YkhBZzR2MTQyWkthTzhVcXFDZW01UVRZclNZVDY5c3dtdTMxdHBRbmNL?=
 =?utf-8?B?L2E1c1RyZU5xOHZJK1VuM0VnTGROT1Rla0YyQW1NUzJRd1NHai9iMDhGS2xk?=
 =?utf-8?B?R21QWHQrYm9RbmJHenVyUzMzOWVOR1JRdHhqMS9HaFlzNksrMTRYeHBQenhJ?=
 =?utf-8?B?R0lpczJudnB0dHNYSTRrdVhTMytlVStCUDEzUVhqMHplV2VaamQvZzdQMXFT?=
 =?utf-8?B?VC9ySnB2clpCUHVoTXMrUHUrSEk1L2pOZUxHeks5Q3cwL2U5TW85Z1VodDh5?=
 =?utf-8?B?c3BLR0U5enNldCtPNjBqWVpieHBHSm5KK05jTzMxM2QvUGFLQUtkOElSd3p5?=
 =?utf-8?B?cWJJL0p5UkhWQzVKWDdtNHBuYWlicG45N3Boa2MyZ2E5bm5uKzlhdzFxd1lT?=
 =?utf-8?B?L2h4SHhBSjF5OXhZTDlUcmhsV3ZzOG9YajZ6QmI0SjRSMFJZNFFHa2I3ZVow?=
 =?utf-8?B?bDJIZjRnaTJpVHV4NXM5TFRXVGZNanlkV215eGdITC8yV2ZEdmd2RUI5QVVr?=
 =?utf-8?B?anRTVzdqci9iaDhGV1BnWm9RS1puc1RvOHFLaFlTd2lrR2FMTWZBYXdOZFR6?=
 =?utf-8?B?bi85R1paUWVIdVUvMm94dkQ2Nm5zTklMMEhvb0FieVYwaGlzbGVrOTJPQkZT?=
 =?utf-8?B?UXRTZW5wT1FKMmY1SzRDTVZxNS94R1JMck41QjFrd21ZV2IrWjNCZEprYlFN?=
 =?utf-8?B?M0kzK05TRFhQcGNzRUdWdm1FUUhPd3Q5RUN1U1hqcEJaWnhhTDRXa1g1WlQy?=
 =?utf-8?B?T01NNzNKSk1CRlFIWktzV0lLTGdSRkUxLzNjZjlzeFp5TFNVNnF1empWOWxk?=
 =?utf-8?B?ZnBCR0JqdlY5WWh0Tkpna0gyQU1pUHJNNjlkUFljR05HUTlNa1UyUGt3ZHJa?=
 =?utf-8?B?RHRGd1YyY3lkZ0F2aTdqQkV4djVIVXdEQytYSUF2VjRyaVd5VUl3NlBtQ04x?=
 =?utf-8?B?c2NRK3NuM0J3WGdvTzh5aTl0NGJHM3YyRzB2UksrWit3Q3FjUjVDK2NoY1l2?=
 =?utf-8?B?a2JoVmYvZHJ3ZjZPWXR5UHFVbmJOTmU2Z1BFaHJGV3RjWHR1ZGpaQ2s1MEtS?=
 =?utf-8?B?KzZtSXNyZEpTMTBzRE1iTUVSWUJpVmw2K1lwcTZjc3I5V2c0TXdEUW9aMzgr?=
 =?utf-8?B?QTdPcHdLcGtVVUJHd2lYS3lVd2tYeEk5MzEzZWY4RUk4VDE0ek0yRno3QnlY?=
 =?utf-8?B?WFBrVW44elQrYXEwR2ozVXdtQ1hCaER1SklpUUtyRHZaSzVyMkNVaDI2RWpS?=
 =?utf-8?B?VFI3Yk1acUJPRlVDM2QxSHJqR3c2WFlnbkhYeUl4VC9EUVhEVXpoc0Nwcmpw?=
 =?utf-8?B?MDc2Y3RwM2RKa3A3emo4MFkvSndrd29aNG9FZ2hEMWxkSVNzRHI0N054WS9a?=
 =?utf-8?B?M2xjVW1qQnZVQmg2R24yeWtoNXhPTitoTkZzQk1YN3NLNTNLajdLUmkzb1hH?=
 =?utf-8?B?ZzFqUk5zRXdtdmpYdzZQVVkzZFVjNGNxemJRNlBCSis1aEpocHZpajI4UjlR?=
 =?utf-8?Q?weQ+L/h11BcMgwLL9s3xDHk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab9f32f-4383-486c-fb27-08dd476b7787
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:35:05.0426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33n2c/8ev1xj3cKmbCV/d0DV1bWp6W9xCf9V33AWbe5xcBQvYtJQWSPajjQ7TBIN+1aaItT5rdsvPu6revihKZmYJ9VAJDckM4FETsCxxBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 11:35:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6296

On 2/7/25 12:21 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Feb 7, 2025 at 11:48 AM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 2/7/25 11:28 AM, Antonin Godard wrote:
>>> On Fri Feb 7, 2025 at 10:53 AM CET, Richard Purdie wrote:
>>>> On Fri, 2025-02-07 at 10:26 +0100, Quentin Schulz via
>>>> lists.yoctoproject.org wrote:
>>>>> At the same time, I've done some shady stuff with b4 for poky where I
>>>>> check (rather **guess**) if the current patch is the last patch in a
>>>>> series. c.f.
>>>>> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper-poky.py#n44
>>>>>
>>>>>> In any case we might also use your container scripts for this
>>>>>> (which I will get
>>>>>> to soon hopefully!).
>>>>>>
>>>>>
>>>>> That itself may be adding a lot of time to the test since we need to
>>>>> compile the container first. Additionally, remember that absolutely
>>>>> NO
>>>>> message should be output to stdout or stderr by the script otherwise
>>>>> the
>>>>> check is understood as a fail. I'm wondering if we couldn't add
>>>>> support
>>>>> for a PIPE between b4 and the scripts so that we can ask it to print
>>>>> stuff (e.g. "please be patient, this may take a while" and maybe even
>>>>> print some progress). For example, I briefly added some WIP support
>>>>> for
>>>>> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time
>>>>> before returning something, not very user-friendly :/
>>>>
>>>> My view is that any preflight checks should be relatively fast. We
>>>> could ask someone setup an autobuilder in a container and run the whole
>>>> AB test matrix but that would be unfair and crazy! :)
>>>>
>>>> I'm fine with having two levels of checks but I do think we need
>>>> something relatively quick by default else nobody will use it.
>>>
>>> After a clean build, for me it takes ~10 to 15 seconds to build the documentation
>>> in html format. Most of the time is taken to index everything, so the output
>>> format doesn't really matter.
>>>
>>> So, quite a long build from my perspective. Not sure there's much we can do
>>> about it, though.
>>>
>>
>> Also, on which PC are you building that? Some people may compile on much
>> less powerful PCs for example.
> 
> You're right, I'd say I have a quite powerful PC, so I would imagine that number
> could be at least doubled on a slow computer.
> 
> I think in the case where Sphinx isn't installed the script could point towards
> instructions on how to install.

We'd need more than just Sphinx to be safe, but then we'd need to 
maintain this list of Python packages somehow and test their imports. 
Same for external dependencies (librsvg and the likes).

> On top of that, the script could also print something like: "if you don't want
> to run preflight checks, set 'prep-pre-flight-checks' to include
> 'disable-needs-checking' locally with <command/instruction>".
> 

I would advise against it, I don't think it makes a lot of sense to 
modify the .b4-config in the repo especially since b4 will refuse 
sending patches if your local git is dirty. They can simply ignore the 
"you didn't run b4 prep --check" message if they want to. This is how it 
looks when you have a prep-perpatch-check-cmd but haven't run it yet:

$ b4 send --no-sign
Converted the branch to 3 messages
---
Some pre-flight checks are failing:
   - Run local checks : b4 prep --check
---
Press Enter to ignore and send anyway or Ctrl-C to abort and fix

> And so, with these two messages here, a user which sends a contribution and who
> didn't compile the docs at all can choose to either take the time to do so, or
> ignore and send the patch. What do you think?
> 

We could document properly in the docs contribution section and/or in 
the git repo README what the expectations are wrt running the checks?

Cheers,
Quentin

