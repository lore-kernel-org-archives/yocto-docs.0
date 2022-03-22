Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B89C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 13:34:20 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.80])
 by mx.groups.io with SMTP id smtpd.web09.9877.1647956056587634200
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 06:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=AmxTFtTx;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.80,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c61sv2R0+eKrN1+c4BCvg1civy/JC/zR4WXpB6fSEsf5iRSUpWdQqlX0NZJNe7BM6I76uaf7B+g608RaF4yHJcyN8Om6sWPmc2R7xnhwzeBTizvKDnZTgkCKqbq0zDHDZ7y827bp6c1Pa811nx7sF7YrPnQCBIlJs2wbBmLeq4Fa6sXjygvdrpXaAcJ4uBQfnO1so8XkaZh3fJU+u3UXDIdAx4al+eADMsET+upirNEB0zzMjv78as1Yrz+Gocq8fccwB4skuBE5poMWcDvRvgmyoDAojHASk39t55Yd4ZchpPETIbLILrXKEFT05gYXPltBDQAmR0pHnab/wD79pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avPVpECkT1jCi45tetmLBL79WZcqjt4WKxt0q2+Q7js=;
 b=gbL3F9t+S6C3qP+oj1Y9XV+fqS1EQiT0eb1I17RwBpGQquKyRWiTtlMqtxEwnRFFluzdfwwNjWGZrQvF1AW/pvIduaFXelgGpttae0yjM9V/mCouT+U0EfpgxSasxRcEP8pD6mBqEQDvTmXvLFCy6raxaTQmBpI7HkEiAJqIXQaDt9oypIOOBg5KIZt23smEEqQb61OwURaLD/qjum9s0lktsciU4qOHEmGtvt5vlaNdpcyNxgv9zcFaLuacr1ce7lHl/XlqNWsTjM9yykgkb1dqq6QLOM3cIksiDfwLCpKZxPghDPRjmetLT0wuEvnFxKf0g1YEm9hd6UzFBEpwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avPVpECkT1jCi45tetmLBL79WZcqjt4WKxt0q2+Q7js=;
 b=AmxTFtTxoEmSGLEbWtV6sxhHPGexRhtUUsNvNXnaULym2gJUd14IG9ld/pRFog7T0bifrspWQv8v/pteae05kxSb4PxetVOx+YZDJ7P0WKemwz50qQcEw1pSUknbjkWD6SWr6y9xRzcYszYLyxaBoVfdCgFE0Yi4ZjmLU6I7Z04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 13:34:12 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 13:34:12 +0000
Message-ID: <a890c15d-a92a-cc01-a9c5-c4d89d31de6e@theobroma-systems.com>
Date: Tue, 22 Mar 2022 14:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH 1/1][transition] Makefile: Use switchers generated
 from master
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
 <b23f24f6-29b9-320b-b949-48b7bbebd375@theobroma-systems.com>
 <6157cab4302631ca624837e94ac98181f81a2dd3.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <6157cab4302631ca624837e94ac98181f81a2dd3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0076.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::17) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d48a782d-ae05-44e0-dbfd-08da0c08a699
X-MS-TrafficTypeDiagnostic: AS4PR04MB9340:EE_
X-Microsoft-Antispam-PRVS: 
	<AS4PR04MB9340D35DDD5A64870AFDF42DC2179@AS4PR04MB9340.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dyje2As7Xcb2M3eN6utG9k/gkAeYWinffQpIXvgMs6ULLWpgH9bLKUMYmK0yYbgxt4oga1zQaku3CppmmbMD77y3tu5zLsTQQGqBY208W17L3yfSdFzaxzJrMIoeLtJ6/kedp5g2ye/1RVxT0zJVEK2EsHbfOCu3/pNOS0v0O9sNztnGopNh+mpa+hl05j+OEgWTa0ql6CV6npOYvrkIZIdJl5+ZZQdhoGmVbNOyVrsNSMVoo0JeOiKK7f/ZmRRl8UPugogwLn7+Q5GmETvQha8W5NzCz5QRM1y9DAIurq1xyyZlbtPB8zVQpjlh122DN+9kJWaXZX56R2dxadExDjGyyORScoKG2g24oL1BcxskXaEbiWWRbttE4j6duzfPgOPWsfxBffptzwJbOflOGpKXHqD4AOZFts1+2C57Dq1GRr+6TWeZAdPa+bnTFuMcjCVtzdcQHZikEaufl5oJv0n8bGl8PUc51PjDmP5yuU6g2MYFuwxRqHnexlxIsVWj3x/1a5OpGRv93cFCCOH4qPSoBA+dDbfmueTTHGjfIv5YvTaF8ecpLBzf+r5zI3oj9Sk5mwR7N1jcT9bqMkfXeOgzk3rXKoKO5fqt6fKmEu+vLhLwYxDflSJaQnlWlLqmAGcwvaUwhWxhO4sriBZmOOrymQ7lkGJWth9+9mpQ+Ha32SRvadgENT+APkjWhQKKZsaF5BJfAeL9u8XbMUi+OJa3WZ8TfvgfolOhXlGeWME=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(53546011)(508600001)(36756003)(6512007)(6506007)(316002)(31696002)(86362001)(31686004)(6486002)(54906003)(66946007)(66556008)(26005)(186003)(66476007)(2906002)(8676002)(4326008)(5660300002)(2616005)(44832011)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2tpWk1PN3JZRldHZjdSbDcwVUtSTTFLanpBTVNSd3k4SjZnaFNVeG55bnZj?=
 =?utf-8?B?RHVtUGZ6ZVBLKzVmYmJoVWVwdmJidVova3dGRWgwb0l1Z0Zib1ZRUXI0aWlj?=
 =?utf-8?B?NTBkclVZV1RQQU5SRytRMXlBUUtSK3NkNVc2SU1vSklleUUvdkI5R3lwdWYx?=
 =?utf-8?B?bFlpK0R5U0RTNW1mYzNEaW1mZ2M5Ym55MVVkdnZlY2RpMFJTb1hZS25sN2tT?=
 =?utf-8?B?a0ZUY3pBM2pNN2ROY3ErbkpTNThiUVVUbzlrRHhKcXBtek41T3YwT2hQMlB0?=
 =?utf-8?B?RXk1TWtqbTdnMXI3N1VMcXpsbWJFSjM0QUpaWUYyek52M0hzK2pXWWRYNGky?=
 =?utf-8?B?T3ZWOVExZjFlMEY5RWZiN1JvTGxudUhMQ3liUGJVT3NaT2RTeDRqZjhjRmZX?=
 =?utf-8?B?MXhzZFR0cXIwYmRadlAzU3FkOXU3Y3duUmhHQklXSEF2cnVPZTlkYVVibU80?=
 =?utf-8?B?TEZTbzVpQXYvNTNpMElRQmpIcllaTmpHdTFhSHgrS2RVRTdYUDhxaDlNWEZN?=
 =?utf-8?B?WG1Ub2R5b2xuNHp2R3hiUUV6TUk2MUp6S1NMWVVnVHQzaEUrUmR2QUozRkFD?=
 =?utf-8?B?TTY0Njd6bUd6TGxOdEgydk14eDJKZ00wUWpkM1lvRjd5aXhtMytCTDR5NmhO?=
 =?utf-8?B?ck5TSldVZGo3VUVRbzZjcTQ4U0ZUSFRvTjhhNDZZR3A1UkJlYzBQQm5uQksr?=
 =?utf-8?B?NjdMNW5KUDZXSDBhaDRodlVpRFM2R01icFJaV2hLUWNickNEZmNnRUh6Z1pU?=
 =?utf-8?B?TmhhMjU2Q1hGOFRaTVhFOEtqMmZnTXFDaWdid2VTaXZCQ2x4TUhTTWk0ZjFi?=
 =?utf-8?B?YU9aZTFZYlRFVmRvQWVGUDFhNGMxQ2RUNERoWGxZVjlvdXRsZkRCTmY5RWZT?=
 =?utf-8?B?RkRDQzFZZHVkMzR0ODBaSVVOdW1qTzBkYXJnMG5vNWRuVnFLMUhLblR6Q04w?=
 =?utf-8?B?U2M2bWN0R1RVczN3alRCTkwvaG9uTGI5MWI5L0E5QVVIRmduekhuai9KSVBx?=
 =?utf-8?B?TVN2Z0t3WjY3cUNPWTcxaE16L1BaeURlWEZnOFFsMzdXRVFEM1hzeWt6dzdS?=
 =?utf-8?B?dlJ5VFRLYVNQZWNUQU0vWGhnZU1FdVJFUSt3RnRKd0ViWi9ySW12ajFRZWtR?=
 =?utf-8?B?ZWY1K3RRTlJ3NWNSMDJ4T0c1bVV2ZVlkSE95Y0E5S2lBdjdMTHFzWm5oL2Fu?=
 =?utf-8?B?TEVDRG1jUjZYMzFZNGM5VGdmaEtYcU9GenNkYzNzYWFnVWN4NUEwMlRkc1hk?=
 =?utf-8?B?dURaWllUNFhXZnRjeFJSVForMkdqc2tBVjE5OWp2dUxLZG96RzVjRGJlNkxK?=
 =?utf-8?B?ZUZCL3pFTTNRQmpLQXU0ZytYNWk4T1A0TUtGV1RiZzk5OCsxV1dtUm1ndVZW?=
 =?utf-8?B?SGpLU08vaHFkUjdhb0xZMEpTYjZMZDdRcnZNeUFHRldoWTFlejVVbFZ2UEx6?=
 =?utf-8?B?anBkNWdXSjl6UVpGc3B2NS9vMExJREhzQTVoZksySnFaSUxvR21nTUV2dzd3?=
 =?utf-8?B?anNmOTR6a2dBNjFMQ1h6ZjNQUXFxOHFqM0xhSTA3TGYwRGdLb1d4NnpMUENY?=
 =?utf-8?B?SjdvT3hPUitGR2F2K05CZzJPWVhxSFF2ZnRqWThtMGN4cVpabnNGcnpmWXBp?=
 =?utf-8?B?Rks2Q0NuQ0xOZ1kyMG5kOVJCVE9wZUdERTVTQ2RRdVVid3FSNVovcTYyVDU2?=
 =?utf-8?B?YXppQVRnZWRhRCt5clhDWTVTM3lScmpucVRpUzIvTHkrSzh3b0tZWGhacDlC?=
 =?utf-8?B?N2NDOC9hVUxUbzZveWdKdFordnhNU0QwZW1oYjR5WmRMS2NpejVPc1hSNjR3?=
 =?utf-8?B?dlUxSDNaV1BEMjZ6OEQwNHNFZ3lyMXkyeVZnYzZxS0g1KzVMSmcxNWU0bmZG?=
 =?utf-8?B?NjdLZURWM1NKZVBHUm5iMkdSd1gwUjh3K3pBekNjZWEvbVlrK0M5WmQwWGh5?=
 =?utf-8?B?amRuNzVWWjJ1SFBhMGZ4ODVEaFVJZTQ1a09tVXk5VHBlSUdwUlZhT09uSTR3?=
 =?utf-8?Q?OEB5pX2VL0IxqFHWVTF52mCT2csraM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d48a782d-ae05-44e0-dbfd-08da0c08a699
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 13:34:12.2282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5oEvkT1cw5ni8gPqR6Xbgu48UbMHUx2HTyGc9WP2/cgUj1ZBj+r2h7N1Sa/WII+etR5WS8XX7ozcpIVxmgC8E+/6bcKkBP4tQzliF4ZrbJfBixnWFjbwi46gNJflJL9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 13:34:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2676

Hi Richard,

On 3/21/22 18:33, Richard Purdie wrote:
> On Mon, 2022-03-21 at 18:28 +0100, Quentin Schulz wrote:
>> Hi Richard,
>>
>> On 3/19/22 16:28, Richard Purdie wrote:
>>> This allows an improved and custmomised switcher for each release
>>> showing the current doc version, the latest in that series and the
>>> latest releases for the project overall.
>>>
>>
>> Not sure to understand the reason for this patch?
> 
> For every other docs branch we can run set_versions.py once and have the correct
> information in switchers.js. For transitions, we have multiple runs of the
> documentation generation and we want to customise switchers.js in each case.
> This is so we can show the current version, and the current release series
> latest version which allows the switcher to work properly.  To do that, it is
> easiest just to fix the transitions branch to handle that.
> 

Makes perfect sense, would have loved to have this in the commit log :)

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

