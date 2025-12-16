Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C7AD5E130
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 11:02:05 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19631.1765882916929240440
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 03:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aBLASEXA;
 spf=pass (domain: cherry.de, ip: 52.101.69.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl0/tiZLSBPXNZ4S9vXr+tKeqpS/s2DrL0oGYHXghccHx04xf6mQUXE7GENQjrjpQRsUYkxJ64Lmz7zSwe8abzIUtnP1KRVYYECGu9tVp55A1EOe+WC9wkUdZFTtFQwcG9ILMCkvKcTE1eSVGpsDesKt6ickv7bwy6cp430/bwuaGf9RA64xqNmHOPerr8q/HXLmwYO/2PK3ZuvH0fcl1MJSEfKcy4BJt5tSykZMJC9r8CpiDIk09848UQKUe1jOPsQq7Xdz/5rG5nIfuS60ygVy2w7/xqCF7Gw5Gv/iRPBem0EDCx1KKVFDrp0141PyPAxUCvCm2mP39R2D4Mo+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cF9NEXcpsR9DZghnbYamen8w4R5BJyW87clJA5FPcY=;
 b=HzLNZcizevvdHpwZl0k45mnQ+AT04BcdWbBbzYBZb2b7Y9eQ+Hvn8s4aSakbhSSa5cgYZXZ9mBM7tRAQ0O1SK05X+h7BA2oxCoIxG9hhe8XvHnt9/bqoPajnvWSROjxRLnerqergrWQvPrRKJF6p/QwcdQzPyL/89Ff5BT85phgMnPL090OOhsb0i/A7RDx2TC/kCEQ0BBxN0JPPsRp5UtSwaCckYbCTQ/fat87Nk3JAzpVNUmi5hML/0QBOYo3Kca/0k/sd5OctJcjksjH+WPcNow/q2zbDFDr9Ll9V6h8KH5AFMU6aL7ESCLUKMs/TPuBbVIYq68SuTPZLIK5BoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cF9NEXcpsR9DZghnbYamen8w4R5BJyW87clJA5FPcY=;
 b=aBLASEXAR6qtw5yW+LpeWsi+RapSfS7fT1arMcUQFt/IpAu841TH5lP2UE7f9sQjU4kyBpoAE0tB0WNivmMduAzo/Lqqdu9rLRYbTtRMrDOBQ0IMl1Bv9IcQmzdNtsclrZy7/RVOu1EgONd63NQUlOSQCiTaSW2hOyXr6okR4z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 11:01:49 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 11:01:49 +0000
Message-ID: <bfb7bfd2-1d86-4e05-8ff7-c86b16ab0261@cherry.de>
Date: Tue, 16 Dec 2025 12:01:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] ref-manual/variables.rst: document the
 IMAGE_CONTAINER_NO_DUMMY variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
 <20251212-image-container-v1-1-fb6586d06813@bootlin.com>
 <1f26c158-7fdc-4b2a-b841-8a66d0344b25@cherry.de>
 <DEZL0HHNAFLA.YE9GBFBU3LZ3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DEZL0HHNAFLA.YE9GBFBU3LZ3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccd2289-865e-4167-f83d-08de3c9282eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUYrdkIvaTQ0Z0JlZUc1LzhGendLdExQYkpYdWozVmNWR0xvUnI5NFc4Q3N4?=
 =?utf-8?B?R1pUUUtsVVdoRHVMa24xcWQ5N1ZvZVdycnd6cTdpemp5SXdqaW1wZjQ5R2ZH?=
 =?utf-8?B?dVFvTVNQRVJLT3h1cE0rdUwwMldSc3AxQnMraE1Lc05FZ3FTQTVYanR5Smwv?=
 =?utf-8?B?dEdnS3VZcnBnV1BkL3pYSzJQcmlDQ09jNkZlZUFPZk1iMFVYQ2hDVjNLY2c5?=
 =?utf-8?B?aEM4RkZhMUhQZFVLTVVjYTBlVnpBV2dEQmdCTWU5YzFzNFdhZ1FiYVhaWTRC?=
 =?utf-8?B?OEVhMzBxdU1ydVRkVHJBU0orMUNGOGRtU3I4aEZ5c1drWnVib2tSKzRXdzZI?=
 =?utf-8?B?a3NzNUpwb1JvQnplZ1g2RUxXakdNdjhycWpxSVFRUEFJbk9MNG9GSkNWVDl4?=
 =?utf-8?B?UjN0VmZGcm13NUwxQTRyVHl6TGRxT1kyM1k0TmhZdHpJR3J4dWtrRmo3Z3lN?=
 =?utf-8?B?eURoMjFCaW4rbkJoVmxxTEhoZWpHR21TMVlLYlJmblkySEZISGJnaXExL0Rr?=
 =?utf-8?B?UXdRcGtzcmVpZFhwVUJPdzF4WG02NHIrVWZmSTM1djB3YVcwZUUzTjJ3VHdB?=
 =?utf-8?B?OE9mWVg4dk5xREYvRkFHc2NRQmJORXRwUjZKdjJBcXdBSzY2QUJFVHc3YzNR?=
 =?utf-8?B?MVV0ZkJELzZ2WStzY1RRa0hMRys5dHN2b0RwZXZpclR0d2d1VmpvQndJbHhv?=
 =?utf-8?B?d1Aya2NxZm1Mbzg5bUFhZG9sdXBvSVdRWUlWamJIUEJLSGhPTVU1NkRQQlM3?=
 =?utf-8?B?SUhwRFRCWlJNSmZjZFpvSlpiZ29PbUdtT25MaWRacjQyb2ZrbENIeWFhRllZ?=
 =?utf-8?B?aHZEUzh2VjZybitrTTFHT3Rja0JUd3V2bFpxMStGOXJ3eVNyclA3bmNPWmtM?=
 =?utf-8?B?aGxEWTJHbnZjamthWFNvUTNCc25uU1V5aFZ3SXJNcStSVUo0QUNjaVcvYU1Z?=
 =?utf-8?B?aXpEQWxmL3VZbm90dE9ZNWFKbE84SVl4TG9PbkwyM1J5Vys1RzlYbkFkNkhz?=
 =?utf-8?B?QWRIMm11Y0hIamRET1hKK0RVNW5WSHZ6bW53TXp5bFRTTkNaeDNQeGJBU0Jt?=
 =?utf-8?B?VmRhYUxrcVFWVmt3VGhsTFQ2RlJ4UzhXWXJEWUNVWjA1M1JTUFF0eHg1OWNa?=
 =?utf-8?B?Ukt4NndKRFc2MlJGWm4vVG1hUkdjWlg0cFlvY2V4L1hSV2JLdjFIYWZ1V0JX?=
 =?utf-8?B?UEtxU1JnVEhoYm1oaHU1TTZya1puWWxGc1U2cTZ0UkpEenhuK2NuVW9pL2Ex?=
 =?utf-8?B?TU5FTlo1eDRxVVhaV3E5cUxVeFBNUktlaUFESEQ5U0hGU0xOL0JGTmREZUZP?=
 =?utf-8?B?Qy9Sdm92dE5WLzJwK1VVbVFmQ3hJSHdjd0hYQUVodG15dGh1TVNrSy85SEhC?=
 =?utf-8?B?ZGcweTNTNTQ3SHpuSlpmb3lIL051REg0R0M5eUUza2VxenFES3ZKNmdZL0U4?=
 =?utf-8?B?bGM4OVBwWU9OS1RuVmtrTERiVUlFRHR4eHVkczR6MVpDeFJvZ21TS201bTZW?=
 =?utf-8?B?T2FKMmFab3VsQ2toaE1VZWxOM1MyaGY4OXZWb2xXVVpsM0tyay9EYVdJT3hx?=
 =?utf-8?B?cmQ3S1g3alA0QmFENlJSa3ZQN28rZ3h2dnpZcjFkZzVUVHRoRk13dmhWeDdz?=
 =?utf-8?B?VDBxd05QeVdFOFVOcnZ3RUhOOUU2czZhWnZjeVBsUFd1VFoxZEFSYlRHV2Q2?=
 =?utf-8?B?WisycmJFempFNUJNNFJ5VjRRdjdJa1RsZzdmcUgrQXJoeVlmZDMrN1JINHFL?=
 =?utf-8?B?clNHeFVVaFRQSHNrWmN3VnpHYWQ3bU5teFpZTVNCdHlNR3dqN1gxNzlRWGUr?=
 =?utf-8?B?dU9KQnJMbzhoK29CaTUwMllmMm9JVzFXcXhya2ErNEdLQ3FGRDBHL1lURXJX?=
 =?utf-8?B?dmkrZzZNd1FKWWh5bDJuUUZ0M04rK3g4MmM2WklZcVk5M01BMlA1a0I3T2Zl?=
 =?utf-8?Q?m0D4BlTGkwP4h2HGxc0lDSJYY7+aAFiq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVhPekEyT05xWnl3QmoxaENyZ0s5TFRPL0t0Q1BMamhrOWpBcXVKNWlDcDdr?=
 =?utf-8?B?anNlNGl1ZTU5emRka01abWpCTzBNNDlYOTIyZ3ZlWEFJWWI0Vk5pQk5wR1Ax?=
 =?utf-8?B?cEJTSVdQOFhiUGVqYkN5M0JBdTZObm5DcTFINEpLNVNuc0t0VTRjWFJFbjV5?=
 =?utf-8?B?NkRBclRrSmcxQ0l2b1lJMFRPTVJrNlBNdkk5elV1MkNjdFVGV0lyckM4ZVJ6?=
 =?utf-8?B?Ty9iYmwyR0hIYXdOWjFkdkJCclFPZEx3bU4xQmlURmlqdXNCSEhzaEJibXBR?=
 =?utf-8?B?MExockdZOUtiNy9HYTk1TWtNdWdLN3FuY3paSmE0aCt2SENabHlrUGVzSFNY?=
 =?utf-8?B?Q2w4Q1ZMdk5tem82UEdLM3ErcnJhN2hjd1R6aVRlMWE3Y2Vyajd6MnhFSUdG?=
 =?utf-8?B?dkVzb0FIL1gwYTJmOWRPRVdOcnNUclV5Z1hpRm9FcW9rMlJ3YXJOOW9taEhi?=
 =?utf-8?B?cnFRbUxvSFp1OEJpckJNaEpEYjVTKzFxaVE4di9SZE9SZklzSDVGQUVsZjZV?=
 =?utf-8?B?cGJIR0RTVWxHVlQ1bkNoNmZlNkNrWmVSVkhsTER0eFJ5MjI0UHFTSi9TVjVa?=
 =?utf-8?B?TmE4TVYxVEQ5a1ZnVk9Gd3puaUhPMEN2TWZGbUZlNHVaaFQxVHJ2bTZCcmNl?=
 =?utf-8?B?a0FjMXRTd2dBcjlsMG41UVRRamdFS1FXN3NCU1owUmNSVDJxL0pKTWpNVHJp?=
 =?utf-8?B?aE80RHM2cTNyL3pXVUUzZlpRc283VEVUN29zK0R5RmRvM3lwb3E5cEFIMlh1?=
 =?utf-8?B?SEZNMEgvUm5iSFNma09uQ2JJRU1aWG9KU3RZUS8zQWtiTUVhdlFsNzlPandI?=
 =?utf-8?B?a2xnRWc3VFJkU0Z3dis0RlMvNkJsbTFibmNoTXNnQk5qSnhobnlQMWx4ZXRz?=
 =?utf-8?B?YWhXQmhWdHdDSU1ITjk4ak9EZTBBVTA5aWxWaEkvK3BvLzFBT1kyd2tKVlZa?=
 =?utf-8?B?NldHM2hEQlBpdU9tLzM2UkFhbnFXMWVDRVFpNG52SW1FVW5ic2gvSHVwOTND?=
 =?utf-8?B?NUZkQmdrNTBONXFERmV3c2hKKzhXMlBMeE5xNlRSTGpxM3hiS3BzWVhmdmdG?=
 =?utf-8?B?ZHltaWNRUlhFTmgwQ295eWVyb1J3Um9PWEJCeXZTYTJEUllxdGVTWWNYN3g1?=
 =?utf-8?B?REhvRTVXSk5ab2FidXNyWnVRd2xnNTJwZGpyY0ZDQjRia3JkelB6UEd0U0lD?=
 =?utf-8?B?SUxuNjBUM3U5enFQc1pKOTVlYjkzVFBxNkZqQlJjY3Byam1yVXdHenBHVC9r?=
 =?utf-8?B?cGNqUFMrRzFoOHd5VHBTenRyeGxCNkFnVXg2UnhrblltbHVNRUE0RDMyWXBU?=
 =?utf-8?B?U0txWVNDb01SckFpV0xIY2svTTJVS1JuUVNQMHlhQXlod0Jpc0hMVXNuRmdZ?=
 =?utf-8?B?cm04K0ttaVN1RkZWMFZ1Y05ZdXRpNTBhTGxTL0RvQmFJZ2NCL1RlM0MzNFYz?=
 =?utf-8?B?TGhlNUUxZ1JreVZoOUxyVGlaUmZsWHpJZ0lqenJJbUhmdWc5SXk4bjNlbGdU?=
 =?utf-8?B?ZDJwS1hRVmhTc3BLbml4Z1M3OXVEQzA1UmZnbHgwb3g0aU9kV1Y2ZVJNd3kv?=
 =?utf-8?B?dWRlZk9zcjV2dkhJZjdaQjVRS0U3V21QY1RCT3I5NThKUDV4emtGTDJ6NUxs?=
 =?utf-8?B?dlBQYzBGWExZU3FCd0xtQy9lWWhxV0FpeUE1RHBobXhCQkpQSEQwTm9HcDhR?=
 =?utf-8?B?enJCQ003Y3ZtekxUcm1EdGJvRUdaVGttK0sxSm5kQkRUZ1diTG5vZHR3SDlX?=
 =?utf-8?B?S2ZleDRPam94L2pwckdkSWtqRjZYeVg5aGFGb3IyQlE4ZHlGMFFtcnQydEp3?=
 =?utf-8?B?S053WG1aM1p0dEN1d0s0UlhCQlFDN213Mjl6eE9RV0tJamZhL2l6Mkh3U2JN?=
 =?utf-8?B?UDUvL0NvNVBScjJRdTlkaGRiMzRqS2wxS0lva2RIbC9HdDNZQVFhbVp3TW9X?=
 =?utf-8?B?SzRoTk9IYmVnZlgvdW4yMFJWemxKeWwzVTlrays5U0ZNUUN5eVpkV1YyT0JX?=
 =?utf-8?B?b3dnUDltUmxLY0RRcmhDRzhBRkUyY29nU1ltYy8xS1M0bUhoRkltV0d4ZEg4?=
 =?utf-8?B?R1JRY0ZGZ0Y0ejdQT21GMUZld1FDaHoyZk9odFVkeUhCazBxZWxmVnpzNkg2?=
 =?utf-8?B?eHUwUkxMYWoxM1RHNFRwZ25hcjhxZHJsaU16Z1BDV285OGw5cDVvRWFZQUsy?=
 =?utf-8?Q?XJSSEws32dJCV72FiTWQ2Dw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccd2289-865e-4167-f83d-08de3c9282eb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 11:01:49.3673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3crtZJ1Hli3BRlFP74UxdPPaA5ol74htA77zsywEpT/WgPx/RVWwDBJ+nSJv5lrDX8JQpFPILBZuIRG4CpNoi8O9z4oeYyLdP+XzP1Skqu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 11:02:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8286

On 12/16/25 11:50 AM, Antonin Godard wrote:
> Hi,
> 
> On Tue Dec 16, 2025 at 11:04 AM CET, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> Seems like the SMTP server only sent the mail to myself and not other
>> recipients. I've got to stop using this corporate setup, it's only
>> bringing me pain.
>>
>> I've already removed what I told in patch 2 was to be scratched in patch
>> 1 ;)
>>
>> On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Added in OE-Core with commit f0645e172bb8 ("image-container.bbclass:
>>> Error if not using linux-dummy").
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/ref-manual/variables.rst | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index 71fe11b83..ac7b85992 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -3955,6 +3955,13 @@ system and gives an overview of their function and contents.
>>>          variable, see the :ref:`ref-classes-image_types`
>>>          class file, which is ``meta/classes-recipe/image_types.bbclass``.
>>>    
>>> +   :term:`IMAGE_CONTAINER_NO_DUMMY`
>>> +      When inheriting the :ref:`ref-classes-image-container` class, this variable
>>> +      can be set to "1" to allow a :term:`PREFERRED_PROVIDER` for the Linux kernel
>>> +      (``virtual/kernel``) different than ``linux-dummy``.
>>> +
>>
>> This seems to imply to me the default is "linux-dummy" but that isn't
>> the case. Why would anyone select linux-dummy? A few words or
>> cross-referencing another part of the doc where this would be explained
>> would be nice.
>>
>> This also *could* imply that setting IMAGE_CONTAINER_NO_DUMMY to 0 is
>> going to do automagic stuff for PREFERRED_PROVIDER but it isn't. I would
>> add something like:
>>
>> :term:`PREFERRED_PROVIDER` also needs to be explicitly specified for
>> ``virtual/kernel`` (e.g. ``linux-dummy``, ``linux-yocto``, ...).
> 
> When building an image that inherits the image-container class, it's preferred
> that PREFERRED_PROVIDER_virtual/kernel is set to "linux-dummy" globally.
> 

Yes, but this isn't the default in bitbake.conf or anywhere for that 
matter so it *needs* to be set to something (linux-dummy would be the 
preferred one as typically containers do not run their own kernel).

>>> +      This variable should be set from a :term:`Configuration File`.
>>> +
>>
>> Are you sure about that? This variable is handled from a recipe class,
>> itself inherited only when the IMAGE_FSTYPES contains "container". The
>> examples in meta-virtualization all have it set in an image recipe.
> 
> Indeed, setting this from the image recipe should be enough.
> 
> Rephrased to:
> 
> """
> When an image recipe inherits the :ref:`ref-classes-image-container`
> class, it expects the :term:`PREFERRED_PROVIDER` for the Linux kernel
> (``virtual/kernel``) to be set to ``linux-dummy`` from a
> :term:`configuration file`. Otherwise, an error is triggered.
> 
> The :term:`IMAGE_CONTAINER_NO_DUMMY` variable allows the
> :term:`PREFERRED_PROVIDER` variable to be set to another value, thus skipping
> the check and not triggering the build error.
> 
> This variable should be set from the image recipe inheriting the
> :ref:`ref-classes-image-container` class.
> 

 From patch 2, image-container isn't to be inherited manually, but 
IMAGE_FSTYPES needs to have "container" in it. Though the end result is 
the same... not sure it's worth the complexity in the docs. Or maybe 
just remove everything after "image recipe" (keep the paragraph below 
here though...). Or say "by adding "container" to 
:term:`IMAGE_FSTYPES`"? See also first sentence in this suggested 
section ("When an image recipe inherits..."), probably would need the 
same clarification.

> See the documentation of the :ref:`ref-classes-image-container` class for more
> information on why setting the :term:`PREFERRED_PROVIDER` to ``linux-dummy`` is
> advised with this class.
> """

Cheers,
Quentin

