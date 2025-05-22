Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69895C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:13:19 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.47])
 by mx.groups.io with SMTP id smtpd.web10.22352.1747915998431182719
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 05:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VRBzjl9U;
 spf=pass (domain: cherry.de, ip: 40.107.105.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPqIQNom2ybi/RclaWIHQpEoe0t3l4t8q8mHNTXBDjCCxSCqyQuG8p1qkRV3GK7zT0xcz9c4ZlguAnI3XS5XtwvGeKwXyzd0IAVxAgz9iNExXCrcM9pSBJu02QhnAQQUw4FeNxckqcrw/PwN2o264oYSGABiCdMfDuL2bfNSu2mvuA0gvEutokmgIx7qEgz07UptzVSj237AP6q7haTMvbSA1/vKTp03rM5fO9lJ3/WmiYK/88fLZCCZcz3XXoWfbsEH+dcguoou9ow16OQREAF9weY1YOv0bSk+gXVxel+HXYxXrSc6Rd9JKs0ae0R6OWI2IoaL6AK9CeHFHy42Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOO6aLggoEqOXDEhMxU6Z1frfsAPFT1dfcRvHozAdsM=;
 b=K8vcXbvL38gzuqBn49/eV2NX6ISr8ddfOcnM2F9FBSysmDEgsHZF0BTz83PuTSuD7AF6c7duNqtTlndxY/WP0kifUaz8VflhH6dPKWCVcoN3vcc85Wc32P6y+N8lw4p0aL/ICq2eZquEinNZfNNP6zy0VE1TA+hYVCp0C36OWXFHjVh1eqNNOFSsF6DooE2pyzRU21XT5C2yheXkbJDSmc8akrHY7JgUZjh10WMEnM+iE9sGhcW/wFpINWoXRbudFRQ51IU+BOujpq1YGcW00qNXrOKPBbanv11HHGJo0+Ip/mVsBR6W9nSau9TcUUJfWeTwDtjb/KraSxVX6pv5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOO6aLggoEqOXDEhMxU6Z1frfsAPFT1dfcRvHozAdsM=;
 b=VRBzjl9UJrfuK4yvfyGz4pgfevGHwi3PnB/0flXMmy8RN5NY2DqCVcvbMBS3tGnJeadrEaOCOk7cm6oNpyByignSzs8MPUv3K1QSsTE8ZoQV9Zgw397oeMp8X9xIRbvrXuhYqRYXRGDb+wvTsLCyMhFJxPGiS//eowQzeRPWup0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8756.eurprd04.prod.outlook.com (2603:10a6:20b:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 12:13:14 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 12:13:14 +0000
Message-ID: <d72ae087-1840-4c83-8895-151fb8141e45@cherry.de>
Date: Thu, 22 May 2025 14:13:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
 <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
 <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
 <D98QDOH9EM5M.2LNH55O8DZ8IC@bootlin.com>
 <62fb508b-741f-458b-ab7a-2ceed64a95be@cherry.de>
 <D9DWY617J6W5.1G9WMLH95TIIF@bootlin.com>
 <caeb301c-abfe-4220-b24b-1073f43efc3a@cherry.de>
 <D9UW30Q030G2.22VWR1SASAWG8@bootlin.com>
 <33eef3df-3f24-4b8e-be45-3552d43252af@cherry.de>
 <DA2LHN94PLKU.HE3O9BEEA64K@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DA2LHN94PLKU.HE3O9BEEA64K@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:57::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 87445db4-fb85-489c-e5df-08dd992a06ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0hxNmJiMS81a0ZkVzB2T2xZMGFhblYvNk81bERJTEtIbkovYXNieW1TNU1T?=
 =?utf-8?B?b3JkT0owWU53VXZVREUwcm13MkZ3RUlrbytJdkhBMzB2dzBtWHRxYkFMbjdn?=
 =?utf-8?B?TjJtOTh6dk9VWXh4WGM0MUppdnJ6d2NqV1M4aFBsSGYvZ0I3T3MzTFVHVHR2?=
 =?utf-8?B?aEcwMHRRckh5cjFGNnpodEh5aDc4bE5LZW1UaWsrMGJUeE8weEdMVlRJdXZu?=
 =?utf-8?B?cGJwSjdBcDBVa3B2djBRbUN4V0JxUXdLRkFSSXpYWWQwd3NRd3hrUXVQWEhD?=
 =?utf-8?B?SGVGRjhvQ24zMlFOVmYxR3V5a2JMeEVRZm5tSWl4VkJWaW9MSXkvdTljZ0tu?=
 =?utf-8?B?dVVTVDZ1U2JreHlzTmFHamJWbndPNStTQm1pekxuNWFPSnZ2ckJKK1VXRm9i?=
 =?utf-8?B?d1pvNTRlUk9hdlVJUHdEVlI0azh2aXR1VVBYSDlVSkNXMG02ZVdVNU1WcU4v?=
 =?utf-8?B?SVFqR1AzRitDY0hRTUhLQWVCREVSY0QxWXZFUFFNZzA0eCtzWEtmdktDWUJl?=
 =?utf-8?B?cHpMQURXS3pmWjYyV2FIUlZMa1dSQjA0WjdQR1JuWjdERkZWaU5BSFJiWFFw?=
 =?utf-8?B?Z2hnOFhGWnVpY0VnLzBkZ0RlZmFQODlJK1htRittVFdGdm56Qng0UFlVMjJ3?=
 =?utf-8?B?Y25KaURqQTlpZWRjbWhEZ2MwcTBQVmVuUnluUE4vV1ZpSS9rU3NVamg5MUNW?=
 =?utf-8?B?Tnp6WWRGVGtFbHRaZFluMnZ3R1hobmFsYktCVWpPMUdreGFYWEZ6TmUwakJS?=
 =?utf-8?B?Sk1TbUZPbVM3dVFiR25ML3RhWDBqaXVEc05VY2VYMWN3WHVUK0NDanpQakpr?=
 =?utf-8?B?ZXprWTh4TzFXWlV3YjhIVjI3NnNyZm9XZ051anFaK251MmRPMlRvYnBzNXhP?=
 =?utf-8?B?RkFzWWg5STJtTHN4VlBOM3U2MFJDRW55Y3JOOElVWnUrZE5KUTBDK2tCcGh4?=
 =?utf-8?B?VmljU1YrNXIvRDA4OTN2M0p0cXo3WWZ1Q2thcjE2NDRlSFpENnNGZUR2SVNz?=
 =?utf-8?B?a2g5YStDRGtDbjFPTkVmR0Q0bXAzek4yb21TczdvY0RBMDdXQ1BNbzdZSVht?=
 =?utf-8?B?dDNJSlU5eG01Unp3dHdrbzN3UkFXV0FvbzB4bGpUemk2Ymw2M1g0cmFQenpX?=
 =?utf-8?B?eGF2ajRnd1hXRGVubk5zblY4Tm5oZ25xdGptQmJ4NVFiU3FZditaS0k1OWMy?=
 =?utf-8?B?VUNZcUZDd1pKT3JzbjhzTWJaTWUyUWx1SEwvUnRIZVQrd1cyMDVkcUlPNzB6?=
 =?utf-8?B?aWJ5RlNVSGtQQmVBMlYzN0F5VjFCSFdzVHhqclJxcC9pVTdjRFhUY3NPbURy?=
 =?utf-8?B?VFIzNGF6blAza09UUnBjZ1JkQ0ZJMk8rdnBXN1VaTkJmUFhUYTh0ZjcrU1Nm?=
 =?utf-8?B?T04vS2xBVFZTenhKb3YyWDVJK2xseTNxUVl3dVR2VmJkdkpDajNoWFQ5VUx0?=
 =?utf-8?B?RnRxUFRQR3duM3JNMForR004TG55YmM1VFFxbHRzNXBSRFc3a2RZZWtpMXpC?=
 =?utf-8?B?MjZ2MWlieXJzbnE4VU9HYktKYTZFa0gvWGcreWNYZ1RwTElzR1RYOVlNUFo2?=
 =?utf-8?B?b01CRDVTVnFTek8yZUpkNkZRQmRZRk9pbmhmek0wM1BvWUp2eGNLUnJqL3Ix?=
 =?utf-8?B?QzdqMThRZjZQcUNQTEFGTVY2SlI0eWVXU0hwcHVoVjRFREk4UVp6Qklld1Jw?=
 =?utf-8?B?SjdSREtyZTQ4MGdTd3JRSklXZGhRbC8rTkVHV2VlcURIQnFGM2ticG12QVEr?=
 =?utf-8?B?a1VSUVdUU3k2YTl2L05iT05haUR6QzhwNGFVejJYakJ6MmtHTVZmYTFyUmNP?=
 =?utf-8?Q?Gn2owp4FlvVZI+GWuovSNh2EsXpV3/fAay09o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3JsVkZPRElLOEwwN3F6SS9lcUpLL2NJeXZDQXdRaUNGZHNrUS9wNTBORjZZ?=
 =?utf-8?B?enlNQ1NMaVkyNzlLeWs4ZXpkY1IyNGh6NFBDMEJ3dmhveEx1WU9jLzFGSUht?=
 =?utf-8?B?NUJybExockVMSHdQQ0l3UCsyZjd3NVl5Yk85a0NuYTdCeHF2M0xidm1CZ0tG?=
 =?utf-8?B?c0Q1anNSK3ppQ2VtNzBzdTMwa1I4bVJWNlhhZW9pWHRMbXBoOEtsMU8zdXd3?=
 =?utf-8?B?UUQ4UmJDT3krREhYdCtXRndpQjN1NjlqallCaXdkdjM1eHRjbFRjWk5MUUw5?=
 =?utf-8?B?OVh1TVFWbHJQZmxRNnY1bjVSazNFSXZ5M01jSFRPb0Zja0VidndZQ1hmVEp6?=
 =?utf-8?B?S3JHK290OVl5WlE4UWxXMUlrbjRKV2ZwbmNxSng3SXptbzQwZmVuL1l6d3Vt?=
 =?utf-8?B?aXlOa2VmZCt0R09sNC9aYjEvRWp4ZnRnSk9PdG1qdXZyTnVvZUtsTFRtdFJN?=
 =?utf-8?B?QlUrdXRwZzNGeHRrWis0cDJlZ3dhWUFjMm1hS3JXeGo1UFhjUnZsM2dlMVNk?=
 =?utf-8?B?MW1ZZVhLZ1lvc3cySmpWYjFmb1kzN1Y1NWVwc0toK3BXcU40Q0k5S3kyZFZz?=
 =?utf-8?B?eStIclNNc3ZWcFFSaDhmbDkzNXpaUkRyNzEwb2NuMGxtSWxNK0poM2JCT3BF?=
 =?utf-8?B?czkzZFVua3c4ZVQyV0lMSjQ3Ni8rT1A1dHZGc0NSYlRnNzU1Z01CT2RYYzNU?=
 =?utf-8?B?M2t6ekUweEJXdFdDQ1FjdktpaXgwQnptdGJVSjl2dWlxRXBRRERoTHhhZ3ZO?=
 =?utf-8?B?ZGRVUGcyNjF1SzNiODJDUERhL3NkallLY3RjZEJRNUxudTBjLzNSQkFSVCtD?=
 =?utf-8?B?emk5MkFpeGJnVHpUY0dsL1Y0T0xtTUpyTmdFZ21RVFcyeHVnL0oxMVBBdHZW?=
 =?utf-8?B?Zk5ZU05KYldTQjJNQi9aak1lcjlTUmFyMWdSYmNraFZGVUVzemMrbmZHdFlQ?=
 =?utf-8?B?eUNEeXJSYVFHdmlhMGYraGxqRkpweXkzT0NvbmpqYzBBTDRYdk1ydHEvbXRw?=
 =?utf-8?B?ZURzZjE0NFdEUWFjMjU4MEoxajFraGs4YmhxdVdVckxjVjNVOUtSZWRiQi9t?=
 =?utf-8?B?Ync0SytYRHRUbmp4bUV2QmZiODlKYVRFSlg0RDNYN1ZtSGN1WmFzYlpDRlBC?=
 =?utf-8?B?UFc1ZkFZWC9Xa1RHdzdWRzJ3TzVLR0ozKzcyOXllelVSTnN5NGVLelVSaFVK?=
 =?utf-8?B?a24vbWQyWGZlKzVFa09hcDlXdTgrcWVZMU1qdVNmN21HWjlBVVdTdUozSlZ5?=
 =?utf-8?B?N095QXZYZkV4UFFMWVFBTUVZS2hSYmNVd2ZQcFp0a1hkcGtDUng4TUdneTI3?=
 =?utf-8?B?TUlsdmpQZDJFZGFMaEg2dHRuLzJlY2pzTlMzMVMzYWF4KzdzdnZibEtpVWtR?=
 =?utf-8?B?QjgyZFlkUlVmalJGdkVrRGdzN2daZnAwNlIrZ3A2bG4xMjN6Q1hUMzBnaTJK?=
 =?utf-8?B?YVkxNzFNTWF1b2dDZ3pqUmozeWp1aVZOWXhYck9ZMDdlaFBGYm9jaUJ4VjhS?=
 =?utf-8?B?UkVwS3hDa1YyUUcrQWhybmd4Q3FCSXZrTU5vMDRaR0c3WDZyUU9qYnFPL0ZP?=
 =?utf-8?B?YWlXRCtaYWRYcTFnbENmMmUzcWgzSTV3Z25UUHYyN0t3MVhlMDU3aW9mRzUv?=
 =?utf-8?B?R3lxUGM0QVpxK2thUjFRWENybUlnU2NhcjUrR1BqMzdZV3VaL3lwMHRvd0JL?=
 =?utf-8?B?Sk96cVFlcXA3M0hkSlR6cFFLSXVUT2VuR2N4SUJrTHNtL2ZHbE1vYVJkSzVw?=
 =?utf-8?B?bmdDVklsRGpLVlVHc0tQc0Q1R2Y0Sm56VGV2dVVtS3ZYdzlLaHl6Z3o0VnAr?=
 =?utf-8?B?SmdWV3MrbG5iYy9sM2kyTnN4ZXA0ZlBZSkZpUzNwLzFRQzBMQUlYRXorWFAy?=
 =?utf-8?B?Um9UUmZnSUNkVmVtb0YrczlnM2g2RVVnK1lHZ3RRbnp3cnJlSFFDNHQxM0VM?=
 =?utf-8?B?eExRN21nUDRrM0V4QXlWT1NDaWpHdTk3UUxzWTZuS0szbENVYWJaUmZnaXFo?=
 =?utf-8?B?bXNEZDhMOFZnOEtaWjJVaEM4MUZCNlJ2ODBqeVlVdmlNUGVhaTJFaTFHNSs3?=
 =?utf-8?B?MXFJMGlCdXpUMjk5SUptWnNjYWVSRk9mZ21sbGxnSDZQZmwvV0YyNkVqdWhh?=
 =?utf-8?B?WjF3SzRuQWVrYWdFTDBvamlTU3B3SE4wckNONWdJVk5QOEdYRzM2Q1FOMHdv?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 87445db4-fb85-489c-e5df-08dd992a06ea
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:13:14.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIHCb4FyBXFxxuP31JD9ZgxeW3YMIP3sKib7wXmstMETJTF+qFWdh4Bhj7nGR/GOq+NKBaFYVOZZ/+MpFjLYba3R6WYTxDKw/29DH4WXMck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8756
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 12:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6881

Hi Antonin,

On 5/22/25 11:51 AM, Antonin Godard wrote:
> On Thu May 15, 2025 at 9:50 AM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 5/13/25 10:28 AM, Antonin Godard wrote:
>>> On Wed Apr 23, 2025 at 11:56 AM CEST, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 4/23/25 11:33 AM, Antonin Godard wrote:
[...]
>>>> BTW, it seems like once you're on a tagged release, you cannot go back
>>>> to the .999 from the dropdown menu, is that intended?
>>>
>>> Sounds like a bug to me!
>>>
>>
>> I vaguely remember discussing this years ago. I think the issue is how
>> to represent this in the menu? Should we really have
>>
>> scarthgap (5.0.9)
>> scarthgap (dev)
>>
>> for each release?
> 
> I don't think it's necessary to do so for each release, but only for the current
> stable release, as is done today. So I think the only real bug here is that we
> don't see "Walnascar (5.2.999)" in the list as it should be.
> 

I think we should have it also when looking at old unmaintained releases.

e.g. https://docs.yoctoproject.org/4.1.4/ but I would think we want to 
show https://docs.yoctoproject.org/langdale/ in the dropdown menu from 
that page.

> I don't really like renaming from "Walnascar (5.2.999)" to "Walnascar (dev)" (if
> that's what you implied). I would rather put "latest" instead.
> 

Latest for me implies the latest tag, but this is not something 
important IMO as it's easy to fix later on if it turns out whatever term 
we picked is confusing.

Cheers,
Quentin

