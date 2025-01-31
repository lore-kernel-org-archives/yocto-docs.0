Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8672FC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 10:04:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.68])
 by mx.groups.io with SMTP id smtpd.web10.16222.1738317882124887467
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 02:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=W420qTfe;
 spf=pass (domain: cherry.de, ip: 40.107.22.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9iM/VVeJaYNDwr25Jhbrle+VibIwsxuqrpPGhrOjlE+EWsJxdR9gXAjIO9sxpaqoysW4E0yop9lOqLB1HvZDXsCdX2RKUi4SzumoWCy2mRyxqWdS0ecpqsEPQ78WV37FseoNQQLUbXOmeGhtxZ6LON3V0ZOJT6JuzWrRodCw9W1HLt71NRN8iVrRTxc/uFotHfvmXYiL+WO81BVfeauk6GajF6frivtbQG8cLLxt3lBorYwcYIe496d0lC86Nul1L2oQCN3k2rQLJeYYF65Jb+Rwxv/rzGGkI1YYjqEiouj6QGz79gGTASbpZ4fByiNcu1dOuB2eltcVmubuFZQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4ED0lkYjKMdKVVvDW4tWJLvxXAFNyuIrNj0OZdngDQ=;
 b=JcTzU0yJOxeUjmKsP28Rr7Zg/49/wiCEk4+b6FCfwJbH/FKmmXnJzIQTJClIn4+rqnRDAiPCPs8MZrY4L8ODdzpdDmsKJwp1HNOf6mKjWDvhlNkuuPntnCzPXxZXUVh9mInZL3qM/PLXyFu+3+2YjxwjPJs4sfPNn1iGDjpI7JrRNKeIZYMl0ZyNPmFPRNM8q774Ds+JJ1T9DUpbH9f89otQubJj98ol73sBGp4fVv0iwKYu6n8JQKBSdb/wBQKEyBDzrZAGxKnCgL07+QhyManvm9g9+a7D+p5lA2tW5V/de5bEQhzDe9F7/cBDfFpUKPSJOTuntBlrsR/LD3Yx7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4ED0lkYjKMdKVVvDW4tWJLvxXAFNyuIrNj0OZdngDQ=;
 b=W420qTfezzgf3f3r25rO0xnLk8R++EMaJEYXnJMGuiToetHbUJX8s81oPasy+BU3Oitc5Gk3y47QvEPc0yBoss1sY15KxfQeDyTomibzkY07zroT5ILoHkB9nzgAbSmjiQQvYVpQtOODUDMI4qskuNEMjPjxgDl3npBE8XAzc+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 10:04:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 10:04:39 +0000
Message-ID: <27834bfa-d240-4790-b8f9-641a0e75d9b8@cherry.de>
Date: Fri, 31 Jan 2025 11:04:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v2] ref-manual/faq: add q&a on systemd
 as default
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250131-faq-no-systemd-v2-1-a6f44b5040f3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250131-faq-no-systemd-v2-1-a6f44b5040f3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: c60fbbc9-30e9-4808-255c-08dd41deac9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bStiK0RNQnZ3aE92ZFkxYmdEUnh0WFhINTRJOStPOWVGNmdJWVo0WWRzdDlN?=
 =?utf-8?B?NHEyYWlyTXI2S2J1UFY5U0JDQzZjYS9BTWtvV3hjc2FUR1NWWUhkMG80eWRO?=
 =?utf-8?B?QmV6a2djUG1tZy85cmRVNVR5TWlwenhBa1g3cXJ5S0lOTG9BdzVrNEZxTHBJ?=
 =?utf-8?B?SUtPMy84ZzYxeTJBalNNaWt4WU15NkorM2V5SUhLV21QbW01bUd0NzdqZFRm?=
 =?utf-8?B?ZEpnR3ZqQW9kQXc1ajBHRFZpclJmZzZCa0sxUHN6Qk43UTVoMXdETzNmU2VC?=
 =?utf-8?B?MnNSOHZSaDE0Y0VQakVsK2Z1WWpTMlBzemxHZ3dMSkFPeERYOGJIWHI2eVpw?=
 =?utf-8?B?WVJ1czJkVE1VYmdzM3lhSTdKTFlRME5kZ3VQQ0E3Y3JkZThwaEdnbFJyQ3hY?=
 =?utf-8?B?MVpXRWRhVFI2eXptWGFueXk1WnNpbCtLUzQ3WkxLbUtGVVp1Ri9Ga0tJbHhQ?=
 =?utf-8?B?SWxWdXpqMUZzcXNobVlSU09WS0tRT2MxaE02Smp1ZHdPMks4RzNleDRlNkJS?=
 =?utf-8?B?a1NCcFloZEw5SDhiY1RRaE4xQjFqK3hjVU9sTG9kUUZQMktMN2tmZmMrVGFl?=
 =?utf-8?B?SWlackRnQ1M4TlY0T0ozY3VDazQvUGNHQlR0bnJ2WVFidFNlZmtZQ0hiNjd2?=
 =?utf-8?B?TkJtaThqZ2RDMWpIdDF6VWR5VW81cVVqZWtPYlU0YWFHUUtyMTRmL04wdTFJ?=
 =?utf-8?B?WWtKWkdOYWE1U0IzTkJXY1VhV3FEU29FNjd4ajMvbnBSaVNaeTlyOEp6T2Yx?=
 =?utf-8?B?OW5HNEgxc2M2cVEwRWM2WW8rYkRFUzlZaEtYdG1uNEJZaXo1bmJURHNQbmJ2?=
 =?utf-8?B?aXpEWkRZMVBkUkdYYWYzdXc4Vk9uM3JMVHdMYUhKNmF6ZzRYVHBkeWJpZ1Zt?=
 =?utf-8?B?WmxTd1VOMys3bTdzZ1I3T1doZ3pEbzV0QkZkNitYVy9xY01ka1YwZi9yRGI5?=
 =?utf-8?B?TTc5TS9Ka3hvMUJKT0V6RzRjVWdCUnZ2Vi9XYzVWZ1czdUFYN2l6Yi9teDls?=
 =?utf-8?B?Q0xiMktZUnlRNm1nTDJFNStoUk51R2NOZi9BZkFXY2ZORlFlZjV4bzR2TXpG?=
 =?utf-8?B?MEhEbE1zRGlNZkdPbUhUeExKeHVabjhpT1lHN2dQeDB5Q1IrTUdEdThhNFdV?=
 =?utf-8?B?blc5eVd4Vk1oYUVzZlFZQVZucGlkMU1xNFRQQ3BkaXdFQ3ZMdnBkb3dheEhh?=
 =?utf-8?B?T3VRdnBwNE1HKzAyK3BRUlp1YVZwNVgrYldWYWgwallrbmxPaFNyRm9tczVt?=
 =?utf-8?B?dnhBNGZRODNVWnJNc2JBR1NZNUIyWEh6THJTb0hmYk50NDBwcnZsczB2d2VU?=
 =?utf-8?B?YVJabWxYcUN6OW5uN0JySERLekpsVmo4VXlvWDM3bEFuZm4wNmRNYkMvTTF6?=
 =?utf-8?B?RDQ0QTVsRHN6UzlCcFlpb0N0YldGVk1MSFdXSmQwN1pXdy9pQk1uVWZzMnRP?=
 =?utf-8?B?TVl1OVZmaHlXOUl3SkI1VGxRbGE1RWljNzFzOXBwbXBzcFY0MWlzWXdUbUg5?=
 =?utf-8?B?SDBZeU9FbGJwMmF6cWpRcDNPZXJRQXpGUTB6MFRmT2J0Y3gyZmQ2Z0tSRldT?=
 =?utf-8?B?ZjlXVm9oVEVmTGFyeUM1ZnFqMGtxbkpyZlFPR05SY1BqYlYxbFNtUmEwamhE?=
 =?utf-8?B?S1lzMlZEUUdEYlhKZiszbElRZjB3ZU9TWFRTTm8yTTJlMGFQaVVhSFh1ZHFP?=
 =?utf-8?B?L3ZhNFR0V09QSmtLejZHdS9UOWwzcWVNN0dDYkNJdnJLam9xTHhpVFRIT3VK?=
 =?utf-8?B?WUlreTlVbUdPR1JLQzhnTEFSaUpGVDBiZ1dHV1J1STVCeFJ4VzduVEg5YkpF?=
 =?utf-8?B?Z0laZXArMEpjY2FrTXpRWEhXcjZZRml1VGNYT3haeE9oblBYSFRidWo5S0Fu?=
 =?utf-8?Q?67j2Aim+gWNit?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHhKcVN3T1ZNeHVLWDI4a2Q0cVFJK2pTN3FCRm5abzRrNXRKdkNaZ3hpc1FF?=
 =?utf-8?B?ZmU0WjlzZmF3S3BuTTdBNHZPemlYN09tQTNBTE5mZS9ZRnYrcVMzNzh0MHZB?=
 =?utf-8?B?N0F2UHRRaVFIelRnYVc5d0ZxQlJqdFFZellmYlNacEEzWU9wQ3NuOGFXSm5z?=
 =?utf-8?B?aFpMTlVaVEhGMi9pK0U2UWNIUzE1TnVKbStIVGkvc1ZlTDdaTDNYR2NDaXky?=
 =?utf-8?B?RkxBcC9nNW55RGNHUHFIUlROcUthZjU2MUE3QVhkWU9LN2VoNUdnUHpNMGlD?=
 =?utf-8?B?WnBINWtTTXNSZHk4VHZkQ1NmYlIzY25xZktKR1Z0SXN5cDlsR2lNOE9ZYUNy?=
 =?utf-8?B?a2RaSEVYYTYyYlQ1bzhPc1VzZ0l1R0tzWGZtZklrcUNPbVJqRUpGbDBvc0pR?=
 =?utf-8?B?NlF6d2JFK1FWakVieVNXNzRpMGh1b0E5V05oZ3VucjlPcjRNRlc4OEhsZ1Z6?=
 =?utf-8?B?b1U4M2RvSmtpNXZUTzNLK2hnZzFlQWVoZmNmL3BTaUZVQ20zUkxpSDFFeS94?=
 =?utf-8?B?dTFXU1RhM2lCTUtiUjZyaU1WdnRBUnpnVlI3NTd1U3hCZXNPTGMzY3RJVE41?=
 =?utf-8?B?RXA5OUhrdHcvenpqVzVmT3l5aDlTQk96R3I1TEVPMGdTU1JRWGg2V0hqdVBy?=
 =?utf-8?B?dFAxcE9saWMvUElkdmFiR21Ta1d1SHZsRWMxWUpDTWkxbWp0K2c5L3lpUXVT?=
 =?utf-8?B?cDBCcjNkVk4vbG1lenVuSDY1cTdMZjBDNWNiSEhFVi84NTFWazJXKzMzVzZr?=
 =?utf-8?B?b2EyRVU1dWZ3OGF2WHNhUkF2RVJkMisveUlFSkVXaDM5KzBFTU9VRS9NdmJE?=
 =?utf-8?B?dlBjeWM0Y2hUQVAySTRRS3pzU1ZJMW1VOWl2VExiYjNjRURqUEp1V2RuNjJx?=
 =?utf-8?B?dzJpcUwvcnBPZlFQN3RyZTd1VE5WbEp4NWN0TXlxMlIyQ0I2TTJTa3VlSnlQ?=
 =?utf-8?B?RUNEY2RJdHJMTTN2eWtRc2Noc0VabWlVODBzeXk4SVQvZVVESUV3OGtkRThi?=
 =?utf-8?B?V0Q1UnB5SkpRODdQb3RKcDhLOEttbGFySytNOFJ1aWxjTmpERnZlb1lkMDBL?=
 =?utf-8?B?V2NLdjZSdFkrQkp2Y0ZLekE5dDkremZ1a2VxRFlnNEFPUlNNTi82WGJQVEd2?=
 =?utf-8?B?c0N2NjN1QmFKR2hvY2piMkxZMUU5N28yYnJ0cHFEWXY2ODU0R3puUXh1YVhM?=
 =?utf-8?B?dzQyUXJsdVJJbjhnZk9aZnN0QkVtNkRQYXRQZzd3Sjgzek0rTVU4OTBxaXVO?=
 =?utf-8?B?RmZpQzUvcGcrU0NWQlc4MWNOeVBXT2tmRlVEQVl5NDVEUy9PVWFCVlJLNVFD?=
 =?utf-8?B?S3dMaDd6cjJZcmNzWFMwNEZQTHVqK1R6cnhrNzRrWitxMUpJcVNEc2RKNExw?=
 =?utf-8?B?YkhaNi9TdTB6Y3BEUEFYS3FiS0lZRWFzd1ZtUU1oeWFZZkdDOHdZdzQ1SkhS?=
 =?utf-8?B?NExXMDRuM1hwUkFoUDZKNGlBdjJZSW9KMkRsUUorSWg3MjRIdjNsNFJ2R0xa?=
 =?utf-8?B?STFXTFliV21mYkgyT09EdElKYjUraGhQV3dOd0l0MTdCaWljeVhSUDdnMTZT?=
 =?utf-8?B?TGx3SktBbmlDbFB3NkdWOVZ1WGE3dXpmNUFuZnVFTXIyanZDS3BFSlNtNGRw?=
 =?utf-8?B?cDhmUzB5aXg5SFdSeHduTGtXWGFHY29NZlhwbWNpc3NLNkY5eU95aHBHbFNk?=
 =?utf-8?B?eHRHc21qcHRPNEIvcXp0dnBURFlJZ3JJald3NytPQklWbDlJMy9ZTnY2WkM5?=
 =?utf-8?B?VHNMaFhsaGdSSGdTazRZUWRMcU5vVzIzb3Y4c1FEZUNUSzZUMWFwSFQ0bVpS?=
 =?utf-8?B?aWFiZUlPcUNEU2ZzOEYwMjRqcXY3SWhrRUNUQTBkWWlNNFhGTGdkM1E3S0l6?=
 =?utf-8?B?ZHBINVhVZjMyM0NQQWF1ZHZmR3hjbVVYS1REOVdJVkV1THR2WSszTHBBVzVI?=
 =?utf-8?B?VlVUYjg5c3l2amh3MzVhL25KTnBUdXNRNnQ1azg2SmJtbFU1TWo5YXpIYm9z?=
 =?utf-8?B?RktBU25iVlFvSDFHOHZrK1M4a1M2aGZhMHlvdVpYWkxhQWdscSttYmdubTBY?=
 =?utf-8?B?akxnSGk5VEg3ejMrZG15UHpyN2xFT0hDSllhU1p4UTRhU3dzSWJZaXRPeVBa?=
 =?utf-8?B?cGJUUVRsWEFxcWFLTUVGTUttWERRQm8wNlJ1SUtTOHVxeFE0WndOSWp6emdX?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c60fbbc9-30e9-4808-255c-08dd41deac9c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:04:39.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8LsRdE3HRm70QpniWLFbF6g7yyQ2UbYJIkyA3DjeE2b2rMhBJAXO0nUn3KJ5c8vHit+563ImneSKBASdOAMyWzJpd8spKuM0qP/M66Y5/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 10:04:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6223

Hi Antonin,

On 1/31/25 10:53 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Originally written by Richard Purdie, but formatted in rst syntax and
> slight rephrasing.
> 
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

