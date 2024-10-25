Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DFDD0C61D
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 14:37:58 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.65])
 by mx.groups.io with SMTP id smtpd.web10.13513.1729867070372211412
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 07:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LQ3ZZ/Id;
 spf=pass (domain: cherry.de, ip: 40.107.247.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdcLo39fNsYL+fP8zHxzIRo1fHIfdIPUr2NHp4DhiENVuclV1oryOssKAPm5XyRmlU4YWZ1oqKU+oAM9iREzLY3xU7WDtuEYTSU2bkGuFYWmBKwFr9WU36+Ia9jXmTPm1d9xgY8CnYlmnLjU0KWudEUezmj659A+PbSfh+b6s2iYqriW21KWUAWQECaUHOSkbIykDckkgWv4qLq7bVkwX3Yf9Pxr9bg5BVuffMn1SZXJ01XusIEki86AFIQI+9VJ10hvczmsih9fpZh22yn4YahXEuYu/pgU+lE0uut5sWCl05aPPXjzov7Xuihi24Bdpd/8mBbrNVvFYOhJmevetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rirNJgcG+s77Cd8OPEC5pGei2XpL757QV3oqKYx3QF4=;
 b=TKL6f9fUpKMpBaZ05cfQMONVG9aW9o7vV+SSoTntfj4iDCMUOjx9iHxsSCNzx7tbPWcfkgvSKuERSG2KsgeIhSqPCLnDQosjNXTGsE8NPr48WRZAHnVUOJ8BghBzBP8MxKvuD3QxVzuf3bGJZcjYus9GhO6Yuw7mSGJ7Cm3rxJBhMPB6B4h/+X55zwVv5hDqyOG+uHlfpMEP58F/67GY5BGboFNHZl1L4+VOTr2N1KZGxp+/2b+sfmdWhLj9yfXO2FE4uFbKa9bJVXqfiG8kLh8jUMIVTV0irxc0fSydrO+TpLH7WuD32IOjm6g9ENaYNsFfCTLyY0mXWAYBLSBVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rirNJgcG+s77Cd8OPEC5pGei2XpL757QV3oqKYx3QF4=;
 b=LQ3ZZ/Id+r6A9oCe6M8oK0nFNJkp8k66Ni5jwpfMIFSd+sczks9wi6OU6jGu9Vqrvo+iAsYlYffpL+OAlRhLP5AvHEVxNGTnDg/fU78mKfSMPs5EryZWDJVGvjXGPleFf28GStgyiQWSZGo7f3Wh26czSzRtce/nXYAkjCNAzjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 14:37:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 14:37:42 +0000
Message-ID: <52c88f7a-4f23-4663-9396-5297c0959d1d@cherry.de>
Date: Fri, 25 Oct 2024 16:37:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] docs: update current releases
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
 <08d90707d7524f11e37604749c1275aa771fd073.camel@linuxfoundation.org>
 <0006cdff-a101-40f4-81e5-c23540bf4df6@cherry.de>
 <fb85055a28b4e3f236ee1c29467d4a503539d2dc.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fb85055a28b4e3f236ee1c29467d4a503539d2dc.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 46499be1-e210-4833-9476-08dcf5029555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzBRdlhvQVk3czYvTnhOQThGa2FwZTBRK0twQ3lncFB1ZnlPbU9KUkFMVEpa?=
 =?utf-8?B?R2MyTk9tSnZvSVFSd05jdUNjczNDeHBJUkFhcmgxWTMzU2RQamRtdi84SFpi?=
 =?utf-8?B?T1RqMnJCdFpLYmlpSXU3QWdoM1VkQ3JCb1hjOW4rQ2RCSmY0R3o4cGswLzND?=
 =?utf-8?B?d0xDbjhyYmZ1YXYxMmdzRkFOaTBLalFaL01CbktKVG1uK1VrNEpNam5BVGFJ?=
 =?utf-8?B?Q0s2MVhBdENueVRNbVp0RnRhaEZFVHdCTUhYbjhEdExlMytTMWFnOHVwMldo?=
 =?utf-8?B?V0s5cmFYOW1vVm02STFJbFp5ZW05K3dSckh0YWprNVcvYmV0YTd6TVZiVGJC?=
 =?utf-8?B?RExWenRBdjB3Y0FpaU84dWIzRzlSOS84VXV4ZENOOURhaVR2WnBya2tVSXdR?=
 =?utf-8?B?S0IxWENIV2R4Si84Sm1NbFhmWTN3NDNWRHFxdVl6N0hLMTkxQXRRSHlHVkFK?=
 =?utf-8?B?Q0lNd1ZwV01EUTJ0RGpQSHZFc0dXbTZqcFIzWXJTNmY4WnNocldPeEk5eUdU?=
 =?utf-8?B?OFdmQ3BTWWpvV1J2VDY1SUl4aDVsdU93b2NvL2RVbHVkWkdkMnNBbklnL2dH?=
 =?utf-8?B?V1FjZHBtdHlJbDF1RldCaFhiU1VTVHhGMXJkaXQ4M2I2U0IzaHVkNDBEaUwy?=
 =?utf-8?B?VjR6U0ZkWEgrK0ZFQjZ5emIwMk5CQ0NhbnROY2xBS2NLRzVXOGozbVdIUStB?=
 =?utf-8?B?bmhjSnU1R3lOOXJ1dWQ2NWozWnJBQ2hKakh5MW1KQmNHVmZuUVY5WHVhWC9B?=
 =?utf-8?B?QUFpNmkwOE00b1d2NmpTd2IwZWVpMCs5SE5uM0VjWFViU25KSmVtMDNIQzdo?=
 =?utf-8?B?azQyZXAwTWlUd2IzUmlhaUFPMEYzVUxaNVRrZENGeFVwV3ZpYU8zVGtiMFMz?=
 =?utf-8?B?TWIxb3FZdkVDVk9lK0N3Y21Pb0VSMDFPRk82V1d0VE9KRUxwdWRyRWU2KzNl?=
 =?utf-8?B?bWF4N1NGTVB6Rld4UUxwS2dyaHFzZGpZVkpQRXBDYmVXalkzV3hrcFBobmh3?=
 =?utf-8?B?STBTNGN0ZUJpZHVhWUpUajNKcStpNDlUSWQ0ZHpUK2NGanZnRzc2WVBKQmkz?=
 =?utf-8?B?ZUVucWlmWU5ycDRhR25jQ0VZS05CdFFjZW8wdk9acHd6K0lZamZNWHNOcjZk?=
 =?utf-8?B?cHNSYVZscXlKclJQc2tvYmEyT1F1SEplZHl0MnV1TXlZLzg5S2tvUTBoQk4r?=
 =?utf-8?B?SXBNWEpyTEVRL2duOGlsTUNweSt6ZlRDN1VrN0xEVm55ZkJUZzNhTU5NUjdE?=
 =?utf-8?B?QmsxM3picXo2TDVXS0NPcVVxN3pLL3FIUHpnb2J6dzJFa3hyWExLbzJzSWlK?=
 =?utf-8?B?OUdIL2hjemZMODNRclNhU29UM3JKd0xiOWlZcmJDaEhVMWhaNWExVmVYTlJy?=
 =?utf-8?B?dS9yaDBpYldPREh6dW8zNVpMNzBnbTR6eDJyMVl1L2QyRFN0WTZFVWJ5YWtL?=
 =?utf-8?B?M3RQaUlzSHVlcXdQMS8vWll4dEFSemtzUER6UXV3SEp2U0V2b2h2Uys2WFcz?=
 =?utf-8?B?dytrR2IwT01CYXJGQ0cyY0Rid3F3SmE3TGY0TGh1LzZsZlpFeFRCanR3d0F3?=
 =?utf-8?B?VnpEZlcvdytZR0JFRjFkUWRwcDh2WmtaT0d0N3hTbXd3RXFlUUIwNkVoRnQr?=
 =?utf-8?B?VStraHZwSEpxODNKSWRyQmgram01RmREVFJ4dU1OS2RNcjZHd2FFRmpiNWNp?=
 =?utf-8?Q?M9fUTsUtdzZgaGJuJQT7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NG82djJaM3prQ2xCb3JKVDRjbnliSjZabUNDTjU1NWkxQU93ZjVZQmxtK3F6?=
 =?utf-8?B?a0x4a1VSc2ttTzN5bFI5dXg2OFlNeEFwTTlpb3lRUkw5eWhVSER6K253KzM2?=
 =?utf-8?B?VWg4czlnK25iQ1dPMlp3RjhjMHRiWkZrT3ZDWTliNEpIYTlVaHJ5WThoTWhN?=
 =?utf-8?B?em9sQ2M1aFUwSGZneDRkeThyYnZXK1I0ZUdxbWZwM1RIcmozWHNxVXlQODd0?=
 =?utf-8?B?TnFFUlF3enVtdk83L0QxT1FVUVhmbTdDOGZYOU5zMHRHSHRRUGNpbnFESU10?=
 =?utf-8?B?b2U3bFNtMmxXeFJxRlN3eFR1a3VlbHdFUzJ0bW9ZS2dMSjhNenoxOVRKendC?=
 =?utf-8?B?SVVzOHB2cnhaMW83MHBvdGRBZXNxRXRBejJQTVBkUTdDaTZFMjRuRkZ2M2tx?=
 =?utf-8?B?UmZEa2s0eWxaM2dYTjdpZzRxbHVEMDN2cHJPaTc5V2ZabDRsSXVFRjZKSVlq?=
 =?utf-8?B?ZEt4YVRwRzd2ZjdzN2cyOWExaWc3TDBzQjhqeURZTkpXQ3Q3N1k4eUJBSzMy?=
 =?utf-8?B?Wm13M0NVV3VCeDVuZk05YmJudW1scW9FdTZ3ZGlDM3dRbWNkQks5NWlYUFpB?=
 =?utf-8?B?ZXR5QVlYajBiL1BVUWpvMjlWTlREano2MlJWVm12SUdTVUhZV1JjVWthVDU2?=
 =?utf-8?B?NWtRQUxGZldJOUxVOE5SdlBUU2RicmllTmYzdEJHYWorWFdxVG5IelJVa0Y1?=
 =?utf-8?B?UWtnRXdsZkVBZmw1bC9YYlZZVmhtTDl4T2dKZk1NUjhuMmt2Y29TYzhndC9Q?=
 =?utf-8?B?d05XdEZoVjRJNWNwbkFNRmkveENxQWlWMTZVNENUOVovcUxDSnR6YTlhYmFJ?=
 =?utf-8?B?Q0lRQWhyZUVLa3VrSTZSQkhpbEt3RDZGMXVkNm93MWVJMkpJVnpPeDRUVFNP?=
 =?utf-8?B?RGg0R2NpQ3lRNUJPRld6VlJtaWJXSm0xSTRqaldyRGJTcktEdjVFNDdVUXUy?=
 =?utf-8?B?aXZOVDhwaEZBOVJOS1FzY1ptTnpxaHdzTlBzbFhSY0FTYzR4dnlZcitUNjd4?=
 =?utf-8?B?cmxGcTl2YUcwa2JQWlp1V2s1aUZtWGVvZGhYUGZlUFVXR0pLU0hNK0JFanVM?=
 =?utf-8?B?WmN0Ulh0dDZUc2kvaUZ2Y0VyamdzRHpKU2wvSXVFdGhpdFhVa2FXeWd3eWs2?=
 =?utf-8?B?QWNyaTVHcnE4VFFOMWMxZ2F4RCtLUDJ4dE0xb1g0SzhWVFRGUFRicy9IaWhK?=
 =?utf-8?B?NTl4UHdnU3FObTdwVXlOaEcyZXZsUzh1U2VLT2ZSYWgrRVBUUndmbnFTWkNz?=
 =?utf-8?B?NWlCM1NzMVZvYk1KNW80c0VUMjFjUi8yTFJuRnRHVm1CMjZDQTFMUzhwaEt0?=
 =?utf-8?B?cGpFeFhsYkVzMjRPRytNVnBhK2ZILzMvR0VIUXN4OThxaTl2c2ZpOWFueDlP?=
 =?utf-8?B?eU1Ub1FsVndoanBTRmllNjNmaXdoYTl2RDRKenVEN0k2TFQyNml5RjBzd0kx?=
 =?utf-8?B?TFVrajJ1aWplLzJNNFhLMEIwWXV4NVQ2L3kvRmIzWFgvZFpCdjRQVFhIelpW?=
 =?utf-8?B?N0lQTFJGZ1JpQ0cyYTVMZ0hLWWNQMHZISHI1dHByUS9HbUU4cGNhYndpOTFK?=
 =?utf-8?B?L0xNaDY1eHAvYUlzbnFmL01aMjhlU3BOWCtpYk4ycjN4Yk80blBTbFMvKzI1?=
 =?utf-8?B?WkxPamR2N1l1YlE1MHVWcy9OMXFQa09xYlZrVnhFV1JwdTdHRmc1M0RXL3l3?=
 =?utf-8?B?b2diYVB0bjY4clpPY3l2SlFyUUdmbGJjV1lZSGhnU3NXSU5SRXZ4bnhHWHZp?=
 =?utf-8?B?WjdmNnBYbjZyMUs0a0xIQk05VW0xSHhKU2poRncrc2xNYzlHczF1MTV3TlBa?=
 =?utf-8?B?TWwrRk9zYVBVRjBabzlCZmRMMTN0V2txazNyNkIvWDdRQ09hQS9sNWZyQTVL?=
 =?utf-8?B?SVRhMTRuZ1pjU0tHaW5rZjNEQ1BMR2F0OEozalV4YW0zbGtYT0U5aDB5RUpt?=
 =?utf-8?B?aVNKRTdJWHNoYnloVlNIQjRZSTdTNW5lUWljdFhLc28yTUw2M1FvcS9iK3U5?=
 =?utf-8?B?SmlmS29tNy9FOGZPV29iTHU3NHhOR1ZPQmtWT2t2WGxDZmNVWmZEYVB1ajNs?=
 =?utf-8?B?elB1UzFyY3RybjgxZGpvY2RPSW9GMlJYN0ZOTG5VRnc3dFZOYUxjaXFNREpH?=
 =?utf-8?B?Q0RoNExtUUxmckF3WHN4eExNd1VZMUxKV3NWSWJvTlRvN0NTMlZTTmZPUDM0?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 46499be1-e210-4833-9476-08dcf5029555
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:37:42.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geRY5Fz6ia5jIQAYOvrZgUtyz7BAm96TVSPSL5QYqIG9iuCEZfC3Hw1BTPZEkH4i2pAraiI07wM8oIo9Fir9QgC89PdDTDUfwYxLyAXAWWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 14:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5598

Hi Richard,

On 10/25/24 4:28 PM, Richard Purdie wrote:
> On Fri, 2024-10-25 at 16:24 +0200, Quentin Schulz wrote:
>> Hi Antonin, Richard,
>>
>> On 10/25/24 4:16 PM, Richard Purdie wrote:
>>> On Fri, 2024-10-25 at 16:07 +0200, Antonin Godard via
>>> lists.yoctoproject.org wrote:
>>>> Remove dunfell and nanbield which are not supported anymore.
>>>> Add styhead as an active release.
>>>> Set walnascar as the dev branch.
>>>>
>>>> The switcher menu now contains:
>>>> - Unstable (dev)
>>>> - Styhead (5.1)
>>>> - Scarthgap (5.0.4)
>>>> - Kirkstone (4.0.22)
>>>>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>> @Quentin: adding Walnascar as the devbranch does the trick and adds
>>>> Styhead to the switchers menu. And indeed, walnascar _is_ the current
>>>> dev branch, not styhead.
>>>
>>> The patch looks good thanks. I just wanted to mention:
>>>
>>> https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=51d842b5e0b14e5439b5c89ec314886218a62ebf
>>>
>>> i.e. we do have a script in helper which we're also doing some of this
>>> in. I think that script goes on to generation a json file which powers
>>> bits of the main website.
>>>
>>> Could we try and converge things. The reason for adding this script was
>>> to get the website code somewhere more accessible so we are slowly
>>> making progress towards that...
>>>
>>
>> We should be able to build the docs with only code from yocto-docs git
>> repo and without network access.
>>
>> One of the issues we have in the docs is that there are releases without
>> tags in yocto-docs but we still have some migration
>> manuals/documentation for those, c.f. missing_tags in the script.
> 
> We should probably add those. I can't remember what was blocking us on
> doing that...
> 

Someone having the time and courage to figure out which commit is to be 
tagged for each forgotten release and then tagging it :)

Cheers,
Quentin

