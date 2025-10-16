Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10376CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:11:42 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.54])
 by mx.groups.io with SMTP id smtpd.web10.4474.1760609495456155464
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kjZP1ilm;
 spf=pass (domain: cherry.de, ip: 52.101.72.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkCOnbmhX/Y5Sjg3kKHDr4fkP99sp3WlZvwLr9LWscRtieUfWRwWB915QL6LK1dlY7IIotusZ8e54GMRbA8VxG4lt8pYXIKqUbvhm2/8afF90QG0LgoYRHaYz8blWcQ74VB0qDl0aAHR81ZuPcRsNR4nncyq/WVx4hKsltKVmLafpZZh++oZW5s6DkjmItZpkyzDmrzW9OAdC+kYvsHJVpOHBpxGNRAjujHvsoYnxzBS0reeptOqmsJg/VgTrYUilIkrIT0td4gyNb/dlM2BpQ4A25ZaQTYI7Uz7XRqEmoq31IC4s7toG3WCMxy5LPZ65Lljx67oGC2Cvwn4UkZKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayGcF2YDB24l6R3VMhkZ/Dc2DReFivCMEyC9omO8LUs=;
 b=aedLHurAFR7eC88KSaCiBFiu5cuuAqOAfPUumndvNuFD30FxzGHW96pWQ/pTUCX9Dqr5RPGt8PRDhn53yGISXJrzuNfAAYLr9xg2kXk3HqGcU9w7HYZT8iBFoA52xOBwOZJgnjGxxnRCrajrAT1FYwjtPBVBdFuSXzj2awgdoRkY6DtmCQj+WAuiDdN/xJDgmhfLdF10EDnVMnPyHtEx10tAj9PvIWNTpg0SQpWU8Y1JMYuZCAyYog9mtMKeuONTrT3kEYyC12PJMTI85rWul5sP8JLWHXMlsEJs3twx19UxEf91JjXcyOoHLd9x6bYWJ/AjQui0DyWBLtfiAboIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayGcF2YDB24l6R3VMhkZ/Dc2DReFivCMEyC9omO8LUs=;
 b=kjZP1ilm4A08jccIwpZ2JrO1SOpAKBjGR5izrg/OE+mqvNQCmXW9kojaFL75MXnUCNPeJe6EG5Pi0rPqwaQKfA99q0BMzcesEF49L/adXjXWNr9pyfSWWRaDduTLlarfB6jMrhh14lF1QFFmHsD3knbPMOmP9gNNNp9AvMza5xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7932.eurprd04.prod.outlook.com (2603:10a6:10:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 10:11:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:11:31 +0000
Message-ID: <4c28df6f-c317-41c2-9da6-aad4e8e2d2c1@cherry.de>
Date: Thu, 16 Oct 2025 12:11:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 07/17] ref-manual/variables.rst: document the
 REQUIRED_MACHINE_FEATURES variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-7-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-7-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d26b34-c7fc-4eb6-84d1-08de0c9c6119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MFI4MDZVa0JWN2JXekE0bDMyVG54UlBpWWZJRXRtb0M4UVd6NEh3Rm5rbWM2?=
 =?utf-8?B?YlBraFFOZGZOc3RxUWtWYmZjZElVRXFuZ0taRlYxMWh4WERRQXJmdFE1c0FB?=
 =?utf-8?B?TTZhYVo1V0tmVlVOV25HUWR6SjlqNFVxM2ZtNWUzelJHREZKUnFXZlBUUklY?=
 =?utf-8?B?UkRESW00aTlxbkRUeU1MUlNSNm5QeE9XdHNBbnlRUElUNUJpMUk0VWdxdllq?=
 =?utf-8?B?cml0MFJVVnpHdlNyNFVNM0xxcHBTcHNEL05IRkNOaStoZ3gvY1lrOGJWZGdo?=
 =?utf-8?B?d2dWSDYremxhMTZ1emt6ZS9PRStuV0phRGdKczB4K01VRitncFRETWUxRHBn?=
 =?utf-8?B?NHRGMDhXUlJqQU5IOFMwVm1DVGNVK3RXTnZ2SDhvYXNYM1hoOWEwRUpmVGVG?=
 =?utf-8?B?Q2owd1U3MmtYWEZHUTFoQ29FMVlwRDNhbUNzUElMUFltYUtkSnY1U0FGSUtu?=
 =?utf-8?B?VUFZWmZNOXh4cXBlRFZBN0kvbTNXRTZBbU5SeEtFekVOQWdZWmdBcUFMMm9X?=
 =?utf-8?B?SVdndm81TVlrRlRRQlkxZmozblZVMTJWclpkSE9USmY5dGhaK1A2WEF3MTQx?=
 =?utf-8?B?SVhTdy9rZ3Q1V2VwaFdkZXp4WHZmWGRTd2RYZjJJM01LeW5IZ2VMVzZpcHps?=
 =?utf-8?B?R1RvTVloeUFya05HSjF2UkRleFk3djY3SEZUY1d1VDBUQXNjcnpESzZqRDc1?=
 =?utf-8?B?QllRN3JHOXA4SkdFVTRBaWQ1N2tWaXZjQmY2UER0VGhpZjI4cjJxbVVXbW8w?=
 =?utf-8?B?azByT0cwUTZ0b0VSM29OczNmT2MrZy9idzNRTTNoeXBZVEVXMVY5YmZIVzRh?=
 =?utf-8?B?Um9WeHNEdVNxbzBGM0ZxbWY3WE5oTFg0RlM1V1BWZTdva2kvK1MwdmhZbVJq?=
 =?utf-8?B?NUZBd0htNlVYcGgzQVBySUJSWnE1eWxRdzVIWXdzcHVPYlJibG9Lakt5SWpP?=
 =?utf-8?B?QjAvcCtnMnFieWswK1R1VXEwNU9penorZHk5NysrdDJvOERDUlY3MEtTc0Zu?=
 =?utf-8?B?WFU0b2x6d1JVTWllYzZCaXVJQWwyQjllNlF4L01wMFJQd3VzTDdCd3IwdUlF?=
 =?utf-8?B?YytxNlFtdTNraEFBR1djYk5LLzd4ajZYejVOK044Y1BQN1p3cUYvdkRuUVgx?=
 =?utf-8?B?dzBxK3l4emxSN085UnY2cS9UOWVMOHo5WU9MRmJ0STdMNkFWM2hpck9STFJv?=
 =?utf-8?B?YWRrZkl5dzg4TXd2TGRJeE5BVkxhdXBmT2NTRC9NS2xvWnFHVE5WK0lDTWg0?=
 =?utf-8?B?QkRDRmVFSFo3VGlLTmkzQ1kvRmx5cVVtVXE3eDV0cmM5OHh2S0NzQ0JGQTVR?=
 =?utf-8?B?R3BRc0JqcjJHUmQ0NDYzSU1sWUN0OG5SSG1WWEVPYVVzUkJIVUViTlpIcVFR?=
 =?utf-8?B?YVpJZXRLWTVMN1J5TFR1TVZybll6SkRsVm5oTGlPNkh3TTZmWmdST2ZwQmVi?=
 =?utf-8?B?dzVxZWo0RFUySVNmTFFIU2JaSlkzQTNwWVpoMG4vS1BxY3VEUFNyTGEwUldU?=
 =?utf-8?B?ZlJPODBRUTZHbWphdzkwSDNNZ1NqMnV4RW13YzE3QkZycEtRZ0tzb3FEa0Mz?=
 =?utf-8?B?ZG1UZ0xhTTkrdkJ3UXJtSGwrZTFUSllGSml1UzB4a0lTWGc0QUNISGNQdllQ?=
 =?utf-8?B?RmJvWHJnUDFEN05SSGFWOHFTTVdMZ2w5WXlidWVITUdrTEsrMVdYNzZVMTBK?=
 =?utf-8?B?UUtaRU9IV05HWmpQeDFlbFkzTjMvVW5DSERmNmlpV3NESUZMb3ZFM2drbjFH?=
 =?utf-8?B?b2ozdHhtalBNeVBLMWEzalN4RVR1R3QvSEh5Zm5KTkltbDZrV0ZQTUhyeHBN?=
 =?utf-8?B?Skd3OTZrV2ZzdHl4cTNwLzZZS1hxaVNTbzZFNVNLdnZsRkYrY1c1bW0vWkdT?=
 =?utf-8?B?VVdHUFM2WXlKaUwxNVQ5RFRpSlNRNVovckxJNDJwSXRtdXFzVnhhYzNnZG10?=
 =?utf-8?Q?4OvLdTbHm6JTtfC32d0EKiVVfqcuy5CT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZENRU1pXY1l3WFFRMnVmaG5HZ3c3cGhBeG9xelY3eWN1R1pZbWdpR3RuVnlE?=
 =?utf-8?B?dDhIYjlPSzQwbjE1OU1HQ2Z2dlhFZkFXdGpvWDhVY1g1WkExZTJvR1prLzRi?=
 =?utf-8?B?K3RTSkhpcWM0T1RpZFZEdXM3S1B4cUNacjdhQ2FyMXBGRVBWS3BkYzZwUWR2?=
 =?utf-8?B?YjhIdnpQK1lFekkyRE1jay9xcVl5M05TRE1uc2w0NjJXVUpKUi8zeGdBTkxG?=
 =?utf-8?B?N3JscjFEclVXRHpremg1NHN5K2dVclVoVnlvazEwOWNOM2ZoOGdzemVSV2pQ?=
 =?utf-8?B?c2Z3MklURko1c056SjJWSk9FM29NWWVRakFZMEV2VFhONFJUSnNnbU9uNXhJ?=
 =?utf-8?B?UVdwTi9ZNjh3bTBaaWxBV2ZMOFI3eTNpenFweTNWQzVFT0o2dG5uNXplcENw?=
 =?utf-8?B?MzAvVENsNWZLaVprYkYxOGh6K01pT1lRVGVUb08yemFQREMvZm0yeHR4L0dr?=
 =?utf-8?B?VllMOWR4ckdpNU5ScjNmelMvZmN3cldmRkUxc1I2V0p0Tzh5RGNuNE5VQWtw?=
 =?utf-8?B?Y2F6cHVhVFVjM2FZRUlCbmtWMkFXU2c4UFZjcllsZFM4QlMzbWNSVmV3dk5C?=
 =?utf-8?B?RnB6RGozZ2RaRnBlRi9aZTA0Z3VxdmlZVGk0VTg0ejFaOEZqaHVBZTdLVGIv?=
 =?utf-8?B?cEFVcnF4UVptOC8rVkF5VHhpN0hKV1RQSjZjV0NWc1lqTysrQmR0NlMxemQy?=
 =?utf-8?B?WE5oUHhwa0RMZFA3TTk4MXY2UHNlV3BnMGZ0ZHBSMlhQc2kwaW9KR0pUT0N3?=
 =?utf-8?B?aHhLbHA3cGdGYVBRYWM3angwT0dBNVJMT2pqcGV1NVJiWkFPcTRHcEVNbGg5?=
 =?utf-8?B?ME15dkl2WVF0eUdRTXdHZi9NaEdUR3VLYjF0NGVSeG9LTU83NFR0SXkzZ3dv?=
 =?utf-8?B?cU1qN1Y5NzVxdUhISG9wdG1YaTNkckdDZncyN25QL0lOOS9aVm1KbTliSEtW?=
 =?utf-8?B?M2Z4U0MwcmZ3RlZ1cDBGZXI0c2YxN0dHd05mZVJvd2tVOHE4RHpSVjN4SEp0?=
 =?utf-8?B?Y2lxZGRQcERzbDIxQkFWYklvWWxUV1FQNStrMlJxUzV1Z3hQSWVvU3pvWGhu?=
 =?utf-8?B?WStEVlMwQUp2NGxBcXhHYU9KZk9RTEVxRGV6VHBHY0xLVlluSGI4dlIyczZl?=
 =?utf-8?B?MFI4dTAxcTZOK2tibUUyZFMwaldSeVNNdXpDMTlvMkExZ2duK1lKbG5HMm1p?=
 =?utf-8?B?ZXNJQnU5KzhveW1MSlNTenpzcUFNRmZHTGkyd296Mm85UUZ6Z0Q4SG1ickE4?=
 =?utf-8?B?OHorQXE3Qnl4Y0dpWnhxenFlV0QxUVl6VndJeTFNZEozNDAwNnE4anJ2V21E?=
 =?utf-8?B?d2doT2lFK3FtZVBtNkF6NXFYSlIzb3JoWk1TK0FYUHQ2WUVxQXRWbmlLRUFz?=
 =?utf-8?B?NHNUUGRkTHFkeWJlSmFmK004ZG9nTWpyZkhjVDlXNnlGbWFucjRWSHhDRXdR?=
 =?utf-8?B?aU9MMWFBbWFlWEZhamRBUVd5QmJjcmtEQVVLeW90Q2o1blh0dEY2Wi8vWGtq?=
 =?utf-8?B?SnJoK29hU0QxME9xc0ZCaGxNdTd4U0ZhWHdpcjF4UlJKS3ZpRUhmMGI1VVFv?=
 =?utf-8?B?SEtTVzZZSElCNm9kbVM4T1RHdkFkVjJjdktOOVpmeDd6VzU2ejRuSHo2VElI?=
 =?utf-8?B?MVJKS09SQmxFZXd1TTIvdVZ4TjJ3dUMzSEJGZE1EYjdjbGJTODZ3Z2VJaXBD?=
 =?utf-8?B?TFRoNG44VXhaaDhEcmNobHFxc0tXNG9oVDRDZTRYcVh1Nzdoa2pqcTQrdmNl?=
 =?utf-8?B?dW5La0NSU29OQUs4NFNSQml2d2VGcytWdjl5bUdpQytLVllQY1dsajNnNDlO?=
 =?utf-8?B?UzBrSm9KVDV6S05uaUJhT0lVbkZpODd4QnRKeHp0b0gzaG5NSlZjRWhXbVVI?=
 =?utf-8?B?WG1wSG5nNmhNZ2I2WmZhWkJDdkhaYmR5bjRBbTBFQStTTit2a0dTTDRNbEFU?=
 =?utf-8?B?K2lxUUtndktrakVxSlJOSWRHU0VqOWxqNEhwckc2NFNPQUdRSFFMTU1oZlZJ?=
 =?utf-8?B?QU9tZTVMT21QVEtLVjdwN3A4eGVESm41NFBVSmJrdExHVG8xd0xrRHoydkd6?=
 =?utf-8?B?c0FJWXlFYjRaUkJpaktjL2NMSjlkNDFDaFJXNldnYzFXMnZWSG80YUY3Si9I?=
 =?utf-8?B?bzE4MDZxaGtra3hmUjZGREFFaUt5bHAydDltQVFvQ0xPYmpwN0hzVmJLV0ln?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d26b34-c7fc-4eb6-84d1-08de0c9c6119
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:11:31.8245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cp4B50ccb+0hNCyDBpYHujQ2K2KiEwDZ8x3jWxnd1kn3GvWMcpbT8ghQjUEcRJlrT47t13WyJdDdwOk86c+YIhrAg+zRrJEBBe4ocAk7XVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7932
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:11:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7730

Hi Antonin,

On 10/16/25 10:53 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
> with MACHINE_FEATURES and COMBINED_FEATURES, rename").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

