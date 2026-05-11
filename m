Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC0BCD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:42:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46746.1778492556635040423
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 02:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VlfrLLEH;
 spf=pass (domain: cherry.de, ip: 52.101.65.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwTAYSjx2NAkSr4s7BYFF9hLQ1QlTFXdAcC0LpoEbYzwjFYsk367QWXlFu/ej5J5X7snjalUWss+ti3mx17K0Nchk+jaQX5Glp8Wc2grViiuBQGQc3Sj76rSTe4eisuTQDn8koPScHP8Buf3n/vywSEUbAA8w35SpqoSgePeZS22yu8Nl3Ut0V1sPcqU1H6T4Ih9X41DXnN8yvLhcKW/eyLSZ68GEwZogUMvji+XH/IWy4e80umTBMMFQdTSaqghlKkeaENHic9iFfFI1WplsBgrsDo2Uy1Qq/sXr7ZW0Pgg77urG2qlvucpoUpRjYTLmY2hDZETJ5KcEG3rtAOLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pr961bagEVFUgfqy41W/roLMUQtxSM7H7caaRG1iDc=;
 b=ixkk0GMm1sECrtix+YGJVVwdACXq8pLukJziU8OPOHtDiSuZM08t53dAs7vsLugWclp9P5fbINwkwyUdOiyOAhFsyu2JSI7UBivZDVnqtmyuJiFh6Q3EqJBhUfnkeZ5WJs5FVzTFrE3JVENLgj3Zsib3HqJFcDMyjb8MjUWasKHSaNR+rfFOUz/RUR6HMMaImNmOp6VonM9nAqgVCXSVg4tSna6qkXo/zfpezIcZhBt0gw5ki7HEjZ4jjIKIIcu6LGD7l4/P+xh2+AkWLvQU/r1LNxittI7+PgDk1VMkT6pK2t7hYF/gkc95bb7BSZE0+/LFqBVyJIRjNZkhbCnAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pr961bagEVFUgfqy41W/roLMUQtxSM7H7caaRG1iDc=;
 b=VlfrLLEH9QJDyxfisXCX3LX6eesmrXWUMUhSCff5PetjxNPD5eX4CrsBGZVAWPBVYWK1dH8lQGnANhWAY/uRl4ldpILMaCYQkJgCImP12V+pMSTB0UpY4vSrMW5axMAhvx+i4PzUwDibR6vSDQt8TFvi8MqfTCL0uXYxqF/i3sE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB10708.eurprd04.prod.outlook.com (2603:10a6:150:225::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:42:30 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:42:30 +0000
Message-ID: <6449364d-e8c9-40aa-81be-95be14e00e93@cherry.de>
Date: Mon, 11 May 2026 11:42:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] YP Quick Build: use "set up" as a verb
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB10708:EE_
X-MS-Office365-Filtering-Correlation-Id: ec26817d-5229-47bf-4063-08deaf419ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4133799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2KM+PfxUSdjq50zIG1zIkHK6OkFywOS/be+LS1CBt4BdQwONXdmZix6Z+C7l3M5OaGhpM0vFyytnI9qBW2NZs63gpB7L4mKCx5xUGKRPiOgDWybGFCzEtcF0jhDX2FG1v5pwevT7uvaCv9PKVEheJCBNb7+F8wXx8uAwVDBuSsFm4oVm7GZM/ewaUVNxxazTBUs0w0PelpVWmMob+DSjawe/V1hH7FXmo0oGs/NWIjhC2hx2G5H0ftY3IMFDlR21qHoL5bBN2LZ/uZP2OxS9v5kM/3sqLZ1kJZXRazvUpf/wopEnhlrvJqVEhVFbmRFCSfEJY6MstQLSzMF0oIl5+vpZcmuwAV8rRJqdQMxTjLP5pMKNB8TzH0Ssvu8L5+PuzRd1RJ2sOC7nr3MWa6eCsWLSlQv08KHa8omD161zNj61oQcJ2UV/ljx7s4FHZ47mwKBhXuew5Pz0DQHvLwONrB+vNGq+C1EoGnb5HUgr2cVxvny2Nvd7PzTWvL6kKbl35ZMfwpT11cXhjaRFuAjG3rG5eRKeiEnOcO4RiC7YOfpArln9Svg8iw/v4vpQA90miObBxXCoE9XETqYLmSxG7U4gaf2tPbD7mBj8fswLxDz+aEuI82lsCQsVYsb54/9w/NAWldobw+Ho57JhCIYLVffWS2AChUL6DV3PaUiv+VnBK9uyvojAAj0vemL90Lf9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4133799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3dva0I1bVhyQXNNdFJpYzFlQjRXQXV0V1hjVmc3VFhYK3VXb0pwMGE3RkdD?=
 =?utf-8?B?UUhkaFYvR1dwSXVSKzFXaU5Oc0J6Zi9BVnRYNTlwSWJWejBTT1UycjlsVFk3?=
 =?utf-8?B?Z3VNZnRoa2dhenZyQ0hucTFnNUZNdXN5WnFlelI5UGI4dXAzY0hxRVdkTlBn?=
 =?utf-8?B?U3FyY3hNRHRDMnVtclhibDNpZVFJbTFXWHlzSUk0dFFPUWFkaUh1RnRRaWF6?=
 =?utf-8?B?dnhpRk0wNE13Rlpnb1NWalg2RllRZlN6bDEyVTV0RUZIK3J4QWFRMGx5Y3RK?=
 =?utf-8?B?V2JOU2p5cnpMWVNwdVVwZXUvN2Y2V0NPSjFwenVwYTZCb1RyeXQwc3hhRnk0?=
 =?utf-8?B?Wkd0V0J5Y0JLYzhzNTljdDI4amRUa2tzYko1KzB1L2V3aitTb29icEZLbThv?=
 =?utf-8?B?aC9XNk5Eb3YrTFhsQzMwQ2RNMHNtMkxWaC9BS09CMTBOL21FV1RhNWZtdkVQ?=
 =?utf-8?B?elNGcGJqak1MSmxZTDdqZElEU3FyM3RKc3pmaFlReFR6VkFzMDJWeVk4SmFN?=
 =?utf-8?B?UFE4aG4yUW55WGFjck9QWHlremFmTitmWjdMZjNXQitMRjFMWUxtRURna3ZD?=
 =?utf-8?B?RmZrZlJ2clBBaExFQ1ppSmcwd0JFUjA0aStYOWx1RXBCQnVaMGZvSnNrV3oz?=
 =?utf-8?B?Z0NXNk9XV1g2TDRNZTVjOE0vNVcvRWNKMG9zK1lUcGt4SGFFcUxyc2FMVjlP?=
 =?utf-8?B?YnZlWVl2UUR3OG5VZ05rbHhKams0bngrc3Nva2hOWVN4MDJIMW9Idm9EVDNm?=
 =?utf-8?B?ak5VcUtwWGpubnQ3K1pYNHIzREtLM2ZGN3pqU2EwdFo3ejQyWndRdGI3TDk1?=
 =?utf-8?B?Q1dORUw1OGgzVisxejZ2L2xwbThSekRxbDdkeG84YUU2S1lyalNZaHFZTyt1?=
 =?utf-8?B?VDdYUUlEbUZETnBocDNaYUpWcDA3SEU4Z0Rxb3F0cFhaSENERFFma3Q0eTlG?=
 =?utf-8?B?S3pJdEg0MnpldGtGdGdRY1dtNjJJZFBlL2V2NVFMRFRoZHpKTWw5eUVtUGN6?=
 =?utf-8?B?ZXBRNlpzSmEybk1vbVl3UjlqUjhkQ25TbTVnQ1ZlNTdTSmZxOEdhTkdDLy8x?=
 =?utf-8?B?MzUvTzJyMzRUTmVHeitHZjVienRjNnlqZWJCR0JJWlZqQzVyWnB3a1RmeUdo?=
 =?utf-8?B?MnMzYXdWaEEzUlUveFdmS0ZrYm9hbHpncFhYSWpJTHpGOFN5dllWL3B3VzRx?=
 =?utf-8?B?WFpyY3E1TlBEN0RZN2xpV2JmMnZPQUp3dzFzT001eWM0VjVtSVVNUFNoMXRC?=
 =?utf-8?B?dXJhWktHTFZTajZaeitoQmQzSUwyUkx5MnBtVnRqakZkWGhtUlFSeG8yaERT?=
 =?utf-8?B?T1JrQzhtMFhWVWFubUYyM3dpNUVlcXorN2g2UGRDUWxVZEhkZkJCNEdvMkFO?=
 =?utf-8?B?UDNUb0pMMzJ1WDFjeUx1V1dBZUh6eS9Fb2c4MTUwcGRScGNBSlVCWlQ4UjVh?=
 =?utf-8?B?L2VCWnRyVUJsNmxJWG1rL0ZYenFqbHNYWkswYWIzU25RbS9Jb3BBL1RmQTFa?=
 =?utf-8?B?ak1zc3E5UFdpUFA0eGlNSVUyVWwwNis2bmVLenFUaUI0cVlRN3ZpbUZweGhU?=
 =?utf-8?B?YlVwU2p0UlhUc3VvckIycDJyOWp6RDFOQ0JNTnNQa0pUV3pEVGRjL3BjUWRq?=
 =?utf-8?B?TjFld0gramlLZjFWZzRTbERab2k0dlhDUWJXNFhyR1FNNVlxRktZaTBtbVdz?=
 =?utf-8?B?Y3ZaU3dVRm9qL2dMUlJKa3RKRkQzZ1NoQ04yTnlab2I1K0RRTlZ5N1EydDBa?=
 =?utf-8?B?REx5MWx6SkFxSGlzNkdaSVJQRXpGR0IvbjVZMmxyYlg3Z1Rka3dwLzZyd01F?=
 =?utf-8?B?V1luMEkvU3pTNDFyc2NuY2FKT2dFNVhRSGFGY0pJMWNFKzF3NloxRmlqTXIz?=
 =?utf-8?B?OG1rV01SbmZ0d25aSCt5YlBrKzhTdm9ubEdITlZ5OG9pTVhpNiszcWRLZkxm?=
 =?utf-8?B?Ui9LRTRmV0xrZkhEdWlnWklxcjhSQ3doK3NXL2dpVlUxSG1xcmI2cDF4K2t0?=
 =?utf-8?B?ZG9MbDg4QkwvWVh3dVlwNHdBdXo0aUhMenBWTVJlT1lxRVFGWnFwb05ZUVpa?=
 =?utf-8?B?Z1ZyWXBZMGwyZ3U2MXlZYTUxRHFBSVViK1dTQzhVUTJRN3NtQ2xqWGo3OU41?=
 =?utf-8?B?cFVnZHVsOUoxUlRPaHhvZS83OUFCMnRSR0lyT1gvTUJGWE5nUEZoTnJNbkwx?=
 =?utf-8?B?S1lYRDUzS281WFJaNW5Va01zUnhqWTl0ZHBEZjVjZmNZRXlrcXhzWkMvbVVx?=
 =?utf-8?B?aUtqYmYxRHRRRmdqVm9mNHYxU1dZbXd1K2ZDUkpzVGwwQ3dWTmpRcGpMenFL?=
 =?utf-8?B?THdSN1FJWkU5NTUzT3NVK3VUYXFBUFd0TFY2aWxybGQvMStEZE5DZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ec26817d-5229-47bf-4063-08deaf419ec3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:42:30.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/VFHMAaIszCnfYXvs19OjvhHFf03PealAK0ihfud0YxUFARGOj3rluHMBxAjhRi3flxFmu4Qw0yr130ixgFmCqfvFi8G0pdHEvrTwzrN8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10708
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 09:42:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9439

Hi Robert,

On 5/8/26 9:14 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Pedantically speaking, the difference between "setup" and "set up" is
> explained here:
> 
>    https://grammarist.com/spelling/set-up-vs-setup/
> 
> - "setup" is one word when used as a noun
> - "set up" is two words when it functions as a verb
> 

The downside of having non-native people write docs in their 
second/third/fourth language :)

Same remark as previous patch on commit title (and your next patches as 
well but I won't repeat myself again :) )

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

