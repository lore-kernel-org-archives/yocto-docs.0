Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71193CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 14:12:18 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17557.1763993526595425206
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 06:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ielCkRdQ;
 spf=pass (domain: cherry.de, ip: 52.101.72.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cR8gWNH//9t5tJDewjxrHAPSx9RCmtQeK6e0yKhLiFnM+HP1/5X5UY3wNzG9aqwLCGvMLTgncASoEokb4fqc4NZqYivt9BhG9DDXHPCgXUDv7WWSQsngBJq+WqYXJV+oDCh445eElywyk3lmasAQFRnBu12YLBQy4S4ZmUp1fXo5XcIvWRI/6zLJKCnHz1q07rlflBwiZhGQpKLLPL6MqDteFZX5xJH1+fWIUxnEGLcRzoX2xzy7ivrS2MQHt25Xh8uCfl2vuZRh89Lp9jWkK+oPqS5ArOIebxmGj8oOMOp2tbUR3ozGSCMukkjDSg3AxzPDKJB9QnEG35ryJJQtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzA6htu7YomPRcauR26K1l3KxXt6nE9/0VjXf9Rk+X8=;
 b=Fs/5Nz6xx/yP1LevK5Z6ImjuMjaJusOR10YvApU45+YPKxZ8wrGN269KHeK8LVRqQleK4boVNSn+BNOafLeHQ1tjOoS+pP93C2znE36Cr4OlzOh2N71dIhGxvhtipuaqPnj+BTEd2d8C6T+2HzGkHXWV9CjyDcdQxzabH+Rq5wGFZMDLH/PFKVcAYkbR+w0/482smx8HXAVbu5TEE70ttJBn2SzZJ+0b+2UBYXVb9yugFgD5rcaJpXzNrz9+5HQZRbCnogXT9dBd/km0eRgn7/A9JhE0UNBZcaAWG8TboOTMr1fFYxskbZzpqt4uuwBqiFAtLRpEPNtm/Nd+1G0FNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzA6htu7YomPRcauR26K1l3KxXt6nE9/0VjXf9Rk+X8=;
 b=ielCkRdQbIrKMP9cuPTApFhLstZ2O0SNAzqSsiE+2C92si1jI+/C8I8mn3WS+zxhKgkY+vR4zADcPSCfHyEZRfPiTXSHRIuefRihspcNWw0Rqu4JemC9h8TGN72wqWZX29flLfc0kw5OmNfAKc+WmSuEnOJASCFZ7meGx0JPOe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB11919.eurprd04.prod.outlook.com (2603:10a6:800:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 14:11:58 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 14:11:58 +0000
Message-ID: <f8fe89d2-34b8-44da-ab70-da26ea99921d@cherry.de>
Date: Mon, 24 Nov 2025 15:11:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] should variables glossary document
 REQUIRED_MACHINE_FEATURES and a bunch more?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <abd05cc5-4e3f-6edb-9da6-70dc18b1c9d4@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <abd05cc5-4e3f-6edb-9da6-70dc18b1c9d4@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB11919:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b23fff5-0223-42fa-2cdc-08de2b636e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ME1CdkF4MWhKdUtyb1MwbWwwT2l6TW4zbEdwZ0VjcHBvK0UzaXp6SC9UQlpN?=
 =?utf-8?B?Zkg3cWo0M29lU0FBcHZ0Z0JQYzZoc0xzYW1OdVNhUTVxNmJRd204N0s0MDhO?=
 =?utf-8?B?alRqeUFIQzR0c1g3Q2JoSjFmcFJOVnJ2OVUvSTk3VWxpYkhnaElUVWJvUlMz?=
 =?utf-8?B?Y0JwMitiVU5TZHBNaFhpY3N5MmtKTHM5Y3FoSjU2SGJWZHh1SldIaUtmU04r?=
 =?utf-8?B?VU05SnJZWXltWVUxaEFGUDlMMUEreGpOcnNrVWlyTmZ4TmdrSWNyelh5eVRH?=
 =?utf-8?B?YzBRaEE0aFU2RlkxY2U1S3ZDWUJBMHNvYTNDbUdyN20yYWQyU21QMnBOaGp0?=
 =?utf-8?B?Y25XTC9vRlFiOXVod3laM216aVJZb3ovVmVEa1lLRi9keFlKN09BN0dDak13?=
 =?utf-8?B?SGh0U0J6aml3TThJcnduSWxEQUdiMG05YjZsNmNCSEY3WTdOOWJWcDNmR2lD?=
 =?utf-8?B?WGVrODF3T3J3Mk5kN1hGaUtxZnJkWWh0U3pQVWE1TTNoRlk3TmhoTnRabDZJ?=
 =?utf-8?B?TmNKTkoyRkRsZEhpelM5RkpVMVRWVWNvYTdkWEdqWUtVcXpiUFJLelpwUDgw?=
 =?utf-8?B?NFg0OHlvZ1ZyQ2IvdFVja1Q1ZGxMN3Arakp2VDUvZitNNkt0Y3FGRWYxMjZ0?=
 =?utf-8?B?MWkxVURpUUVXQzVScWJoZGo5T0RYeG1BbVkvMnpvbmExNTE0dFlsck1zZUZh?=
 =?utf-8?B?YkxMdUVCQ1RFa1B3WnBvczlkQ3NGcFNQSVRQVEN0d3Z6clhJSWxteG82d011?=
 =?utf-8?B?WjlETjl4bzMzYktuc0c3SWJUTW1FWUVTOXRBTjNmbisxSTFsQll2eHhiWFcw?=
 =?utf-8?B?TGtjQU41RHh4aDJmWnQ2eXFDK1hNZXZRU2s2eTlLSnVPaTlkb3hVZUNLakta?=
 =?utf-8?B?SEg1OS9ENk5SVm83cWM1R0JidlI4dkVQYkxzTUJ1SHNjYUMwSzNPL2JMZXkx?=
 =?utf-8?B?NjFlT21acFhCTW9wMjU3OEZQZStBRkJXUG9oVWNsWjh6ZHBSMy94aG9JRy9N?=
 =?utf-8?B?VFp1d29uRFpyMnpVdnJhM2x4ekNtWjJQbW9URlhFWE1MVzdSR3B0TGk3L2N2?=
 =?utf-8?B?K0twZXFCcFdFUWVjZ3V5RTFteDhqREc4SGc5UUZsWEx0cWkyempISnUwTjF6?=
 =?utf-8?B?YVREc3QxZy9jc1F4OU4vbmhHaTBUM0twOXUzYmdYU0lCNzZwOVc3WXdYL2pN?=
 =?utf-8?B?c1pQNUdzd2NLZzBSZ3hpN1p3THlKMFNiN0pZUzV4RzZheVNGc0VKbmFUemVX?=
 =?utf-8?B?THNmNzBPRGJRUnE4VS9xckxuRXVhQmNsMC9PUHlQaWtsaFVmaFR6RVl4MGpa?=
 =?utf-8?B?NUZMUWptdjRjODJNTVUzbVFoU0VldkViM3pNNEp4UjNrNFoxY3l3cnp1eTVx?=
 =?utf-8?B?dHNiNy9NMUZtUW91ai8yUm1xa2RyUUFjaGhWZS9XdXFtUldSaHpMS1Nhd3ht?=
 =?utf-8?B?Y0c1NEp1amlnU1FxZEJCT1RNZWkzZkZLVTNKL3d4eWpuNlNCVjJEM2FVWXk1?=
 =?utf-8?B?RDRaV1QvUC9SVEQwWm1RZUROSEZSU2YvbFdmcXUvRkRDZFJDQ0JZdUd1OWlB?=
 =?utf-8?B?VDRpekJxcjFxOTNtck9IeWVDbFZzVjhhOTJnUGpFWGlSWmFYM1pUclpHaDMz?=
 =?utf-8?B?ZlMwN0JKeGtxbVluTjlqVlVzcTBwL3RsNmpla1JlU2RraUhUVnJzSUlzdDky?=
 =?utf-8?B?OG9QQTdUazF2Z0tuV3lnV0RJT1I3Uk1hMjdBb2pnTTRqOFZTQW8vYjV4Rkdl?=
 =?utf-8?B?WDBEdFpMbGRVZEZnMzA4U2ZlSzVYbGNKYmdCdzNoYWh5UnpuM1VZZXMwaXcw?=
 =?utf-8?B?M0tVR3NIM1BYVGtJUHFzZnl4SXV4QUFGeG1Ec2ZWVkpHWGpScFhrenVyVGZv?=
 =?utf-8?B?b1Y3eG1yZGQ4aXp1UEYzYWZWald5SkdrY3Bwc1MxZ3VldGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmR3ZWxIeVYxeTE4b0pHd0FMeU1Vd0MvNjI0c3BJaHdQZWw5aXRDMU4rSGVj?=
 =?utf-8?B?T21GNlJUUGs2MnJNRkg3WFNlaElJcFVQVzdzaXpsME12c0FQd1cvZjJPQWt2?=
 =?utf-8?B?MnVmOFBFOE9BakRHRktTVjVnTitmeGI0ai93ZlNnWjY1KzBzVE1wQVJ2UFVM?=
 =?utf-8?B?dzAvRURuSzFBKzZjQjE1b2hLUDZDcnZ4WnJSdGxabFNiUlo1MTNNRGNqSW1C?=
 =?utf-8?B?OURralZGTG13cE9RUU9pMHBxdjF0eHJBT3RIdGFRcUJzNTRnb1JhT1FmbUwz?=
 =?utf-8?B?ODNkQ0pCRmpzOThqR0k4TWRPeDZLMHlZSmtLdktFWmVVODVZb3JWanU1bHVY?=
 =?utf-8?B?RUFKc2gyM1ZVS2lKTExTOXcvNGRxY3RhaTFjbVJQWG8vemV4dnE2MG9YL21O?=
 =?utf-8?B?czhHYzZ4Y3djVlJsVFFoQlhsUG5iN3VCRDZYVUZzK2Y5K1IxWklNU2J0ZE5K?=
 =?utf-8?B?RDl1ZWJkQnlFMExoQkJ3YitlcHk3RmpTQ1NhOVRmQ3k2TUtaeGtQbW1CbjhM?=
 =?utf-8?B?bUV2QXlrbzZpSHUyMFF3aVpKWm90SXFsUmd1VlpwdDRkUEIybmtjRklBbHo1?=
 =?utf-8?B?VGVQTDZBQ3lESzc2MW9DNkREU24xcXhNeGx6RGsvSW5FNmhwMmxvV2xNdWI1?=
 =?utf-8?B?NlJBV1U3MnBzZGpHak5SK3NKbFB1N2N6K21OSkVFQTltV3N6UGhsK0Z0T3Np?=
 =?utf-8?B?SzlaOGlGY3VTV1hjczBJWXdYbzl5UVRUR1gzNHhadmRPc3FOVUtJU1B4OTFm?=
 =?utf-8?B?MkVVRzBNdUpuZE9reUIzVFRBbzVGa0RVTm1DZUgxSWNyL2xhbk9MRHlVak9o?=
 =?utf-8?B?ejF4a2VxYlJRR0tSVFZrQ2drV3krQWZNdjdFcDhvK09wVHBYV0VIOFFsSUpp?=
 =?utf-8?B?NDVmejk5cDhmNitKeHpWNVhGV0hNb3NLSGdjVGtBWThtaFRBcEd3VGNGVTIz?=
 =?utf-8?B?MGE5SHZJMEM2NXBIYlV4QzJwZnlPUFpPVmZodHFGZzhHZWt3QmlmVzczRDY5?=
 =?utf-8?B?c0RNUVMwRExtZVd3ZjVsMDdGRnA1YWN3cVpZNElVSUhkRUtMU0pqbUlJQzJZ?=
 =?utf-8?B?SlpKZ0ZqL2N0a0d4cVhZVGpIQU90NmlxUFdhcVJtZ2p1ZE1xY0xJNlBGZWoy?=
 =?utf-8?B?c3crWHdFWmIwdk9IQlNRc29OZTdRenRRNCt2TUlaUkUzazJuaGRzMFhwb2Vp?=
 =?utf-8?B?bXplZ3ZRQ3BMV0lKc2ROVE5BUGhQT2N4VzJzNEREYzNRczQrazA3SERXYmtD?=
 =?utf-8?B?Q1RIblJMYXFIZW5iZGx6ZGJ4c04wd3gxampzNGViQXJsVzNub1IycWNWWlBM?=
 =?utf-8?B?VmNBSXEzVThjVTV1Z0RDN21VUXlOT2xxaEQwMTVXSWtnWEo1YWVxZFBTSGY1?=
 =?utf-8?B?MVBzQ0VvalFyY0kraXo2d1ZYbENsTkExcHhIdVVwbmRDekFkWU4waGxZOEFt?=
 =?utf-8?B?eUhrejNDSEZOTlR0cXVYYWxXLzA3bmUxTDZBYjkyWENYcnIycExsVlFyNXBr?=
 =?utf-8?B?NzFKYi9PQ3RRemRlVDVjL2NFNk9QNStTcFA5TXYxbFJLVnRsSURXRURGV2Yz?=
 =?utf-8?B?RW9SM2NZNkVXUjZmREFXY3JIYTZkcDZZREVCU2lCT0dnZEU5SWsvb2wzTW42?=
 =?utf-8?B?VCs1YW9YWkJHRU4yNHpja1hmenNqa0VMaytQV2Q0d3VxZ3pBSGxsR3diOFVm?=
 =?utf-8?B?Z0tRSWdoWnlNMHVxZksrWlkwaWQ3K2JGbzVNMFVpQVVrUllLS0F2TmMxVTk5?=
 =?utf-8?B?ZUFqSTAxUm9UNDVHWGVqWGtTK2hnZmdsckFLWU1TSCtRZVUxTXQwUmg3MFVh?=
 =?utf-8?B?V0JHUVZXaW9DRzArenhkZEtiR0NiQjNPWCtXUFFkajg5aERsbzdYeEV0YTk2?=
 =?utf-8?B?L0xvTlEwM3UvcGh2Q1ExL0hzZmtNWEQrclZIdnFGN2RVT2hTa0Y3d3dDWTdp?=
 =?utf-8?B?aTMrdTJGSkQxL1F0Ulg1T05tMEd2czMyT2Fwc3ZMYVQyV3YvZGZTMU1xc0Jq?=
 =?utf-8?B?QjlSdlk5THNYUmpodk5qaDU1QThnbEl0ZEduWlhUQ1l5MC9jeGpyVjVhbFJP?=
 =?utf-8?B?Smg5VC9OTHJWYVd3cDlPY0ovbE1Bem5ZaU55Zk9oOVFpMXpJVXRIUU1KZ2lj?=
 =?utf-8?B?Rm5VUUZad2RMdy9SZVR6Vy9McHNPMzlOb09TdFB5UVAyTzJrQ3hJVzlPYWlw?=
 =?utf-8?Q?X2mLnSw2TkxZ+EzSDPhcIEE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b23fff5-0223-42fa-2cdc-08de2b636e28
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:11:58.4051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhJcu2jaykCneIeTcQBtL+dZq6cbIZcm7V+73ZHgbcKv+10H6aW5nzl33m6Sh2cldU/0/csF2BFyGUnVZvH3ojyVWhxCotmVQvzHtLkPz1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11919
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Nov 2025 14:12:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8105

Hi Robert,

On 11/18/25 4:43 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    here:
> 
> https://docs.yoctoproject.org/ref-manual/classes.html#features-check
> 
> the majority of that bullet list of variables does not contain links
> to the variables glossary, simply because those variables are not *in*
> the variables glossary. should they be?
> 

If those variables are still used in master, they should be documented. 
If they aren't, they should be removed. One exception is the migration 
manual where we cannot have links in older versions of docs for the 
glossary, so there are old variables that aren't in master anymore but 
are kept.

Cheers,
Quentin

