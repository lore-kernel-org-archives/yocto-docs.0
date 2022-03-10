Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AC9C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:07:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web11.8077.1646910468180115827
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 03:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=DTLO8FjJ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.54,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY9pBG+WDcnyZ19nlJAPNMjfKnN6d7hll8Ss+QscXhIv4MNTYFTu11b8OtggNMb1O1b8eINdQUJURVVvHoBbyJvG50+xt0dSNqKr0zymrxIgfQyOQSyUaSto4bYAcHL5nQYp1XnTsyo2ILncqLXkeOgeo18Y2tQbjTv35zM+31uO8AOUhEc8grAUyjwq8COuk8K45boYJyzqqp3wIvHRJvIlTDDT5yfLPkpSpgGxuo4KeETGXeMODQuWcNmR3BYNLul63+NexOGBr4bwVWYmzSsMaLzeMysfCHKTUUObLVsVw9umAJHfCpk+K1QgUrgMDBYCEX21DweZ1+DlDCGxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzA7MurnRTcD1s01AJguWlV5z2J+bTJVCqllRFuqq+0=;
 b=ORBF3ogwAHczTuuZkIngEqt3QMxK4F51QR1uvZC9M7a4iE053LNCIFMnZK6QfIX6wtkSJqRzHfP7IXFPlqZYjoYhQEWIYz+Jfvw9GcHE8gf/CT3J/ZprxsTA35DG85wFTEp2qMnABWWcqe2fqr0+Weog9ljTiZ9W4qUlKNiPvNCBqo+Zwqd2GW15D6r+UPRp3nj0MEWMsMNEw2x9YT9L6zsDEFg954tKvT5IZyNtJRjb8bgn1c4fly6o+IN58uLW27xy7mOaANOUnm4ggllCSzvrADkQ4cKCUTYybyGYdPOfs9ZmdEMHQNU+AAB7xqHjGRQidCSbY3jE54pJHfUj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzA7MurnRTcD1s01AJguWlV5z2J+bTJVCqllRFuqq+0=;
 b=DTLO8FjJimFJsCYYyOupFOXywk9XFj/0vnq0pOQCNizZizOlsSkHwq01gZkmGxlbzqdhGCfggvKF9jJIRDxRG7Mg7Jm8VKf+eIvrq4OtHnc0/TeKPzh1H6LiZaZi9fK5ua0jerfbMD900risOk+60z/+0XsWluNplx8kHoQfl8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB7958.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 11:07:44 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 11:07:44 +0000
Message-ID: <6693cd90-6a7e-c5e3-f2fb-ef349373d031@theobroma-systems.com>
Date: Thu, 10 Mar 2022 12:07:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] docs: migration-3.5.rst: fix "distutils" typo
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220308172354.588113-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220308172354.588113-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::24) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63611357-9408-408b-c046-08da028633ac
X-MS-TrafficTypeDiagnostic: AS8PR04MB7958:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB79589AA15A5821867A3F7C45C20B9@AS8PR04MB7958.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mZ8kT+ohhHvs/xI6lk7F0HjnaTxM+axFgYkq9BC/6+Py6n3bkJHpXfNKUptp9f8jvKEcM11wzF5dtt5is2RCZRuURZKaUuFsD9gKtx3br0WTFv4TXCTVc9XCtooiRmDpNcQBS4qZGw28HEu6Voc6zO6otzR1Oj6XmVV3v0ueGEEapmBj+VA36Y9ZnYwtoiHrAymTviOVz62W5hS6rrU4rfw3MDN4UV/jNjoJs9INIqoZJj+bwNIh5bXrG9M9ftZu4KxuQr4DQDbo+w8oKrqKVwJv4xF/EWPphLAqF1IZFN3Ywij/gYQcJWPS7ZRhuKR1dUcYgyWeNmH207y+EyjfGVtA9TNDfvBe+t7SB7pkCWzQNOKvQeeHtLQgohQkFDceAV7jphgQI+Y7xFIwlMtphAy4pURhOot+Z1zZPyNx7Mbhi4Pa78TJZ8ZiRDTnG2SZS39v1ycP1miOC5soLSY9rKzcohnMkccc+yNMRmg9Bw5OlmGMq2OqdXvdJ0Ihsnqzwl4TD4XoopXpe9Noor3R4KQtnw8gFJBkFsL81RIFLszhWAH7XnY75adj778MIMbmDyddzetSC0yndGSo2GQBz+NzzsDeONS+PdS+Pf7xByLeQoG3UcWhgsyOPcHfSV+S62n62TZ5hSs7EqfnYsnumKK55hAcbQuXlgime2vQF+Y0SQXIgMKZtxGPa3aU7BXr83cNSUa/NDU8OFYHujB0HFJYltmbyX3zUIHW+pEcJFo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(66946007)(31696002)(6506007)(316002)(66476007)(558084003)(38100700002)(66556008)(6512007)(8676002)(2906002)(53546011)(36756003)(2616005)(44832011)(26005)(6486002)(31686004)(5660300002)(508600001)(8936002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnlMS2psWks5c0pUOUxJUCtYVHhnTU8vZ1V4NUs0WWIwZVNEeXlBaWlLbXIz?=
 =?utf-8?B?a1QrYWxQMTlNWU51YVBteXpjWXNXWVlWbjJzc0JlR0ZsMktDaFEvOS9zTHNF?=
 =?utf-8?B?S0pQKzEwLzU5SmpRZCttSnI5eW1JSDRLcm1Vd2FuZUhjN3J2T2VvVjRHTzNw?=
 =?utf-8?B?WFhCbDJPdWJzYkdoSzdXMzlCSUxEOFpCU1VWSnh6SVB3R0ZTWm9XdldmWS9F?=
 =?utf-8?B?cG0veEg1OHcxYXFVSWlhb2JPUzNRMUY5ZjBCNXBVSDRWWkNOUjRnS3hMR2Ir?=
 =?utf-8?B?M0xpZFpiL0NvYnVKQVEzVStjL0VOY05hVkdLZ2RkUW9RYks1RlNTQitxKzJ5?=
 =?utf-8?B?a2Qwalpvb0FubmhseE9SRmg0TW54T2dyVEtxbUN3VGJ1TVgwTEVjTFpxSm50?=
 =?utf-8?B?YXg4OGp6M2MzNUhZQkw2eFREbngrT0FHN2JNZnQ4dXZ6enVldngrZENLZWZr?=
 =?utf-8?B?L0VMMXk3aHVwN2R0UklWWFVuZ2VHZUEvRHZOdGs3V0x3YkpiaU5jM3ZPZjRE?=
 =?utf-8?B?NHlBYXdBT0p4d2hOUkNnVzhOMXBkMUVHZFRyVitIdEE5dmorTXVXMlpuWUZi?=
 =?utf-8?B?Z2tpTUNITi82djhHc05MSVI1dE0yNDdSYlh5cHppa3hvZFNUUGJSdFJkRnQ1?=
 =?utf-8?B?WjIyRnJGb0JMM1MxeHJwcDJNYldyMnBGUXlaSXU1T1l1TXVvWmFSNUlWUng1?=
 =?utf-8?B?MU9FYytvWWhqNWFiUkxKTzRqcW8wMzJHRlFhUXB4dGk2NDNlSWE1VzRwV2My?=
 =?utf-8?B?TE5WNjNaeURnNFdFT0FwMHNDUWhNc0FXQ2xScGwrMzJ2eml4OVFCT0ttaHdC?=
 =?utf-8?B?ZXhhQ2J4anloN3RqU2NNQVpIekl1MzgvTTFCazgvOU1VaWZXcitMNkhVMFZP?=
 =?utf-8?B?cEdMam1yUE1yVnBjQ0lYa2JRNGdrTFF2dXg2YlZ2ZVdJUlI2QzV1MVcwemJq?=
 =?utf-8?B?VHM5eWs2WTZJMEVuZzNzYmx2ZUdaQzVXVnhaUGh5YWZDc2RocDFRcXlIdU5N?=
 =?utf-8?B?SEtSZ05QZW5QOWt0cWVUNDVlWG9hYjRyeHVwYm1ZYzl2Y0VKa0R2blZrWkxE?=
 =?utf-8?B?amkvUzRhVnpFZlpyNW4rRXdRZzlYU29WTng0aW5YRVBEYkVBSGtoc0pOTXBr?=
 =?utf-8?B?UXhXK3ZqVnVVbWZWMi9haEpKcUlYM2cyQWNqY0lMeUVHdjBuY25hSVkwLzFB?=
 =?utf-8?B?dEtXRWc0dFB3UTlPM3RDY25zWGFkZzFkaU51ZjRmTzAzNkV1QTJaQndIRnBM?=
 =?utf-8?B?dEhldTZZUnErVDJUbFJ6UU5CSkdvbnBVVWpyNWt4SURndnZkWEdFWDdNL1VK?=
 =?utf-8?B?ZVR2T0pMblo5ek9xUDBvT2dtRzhaa0h0T2xUKzhJQzBXSllERzBnWkV5VXBp?=
 =?utf-8?B?ZHJIYVVUQ3VuMGN1QmpoVHNUSWFaY05jNXc4TEk4LzRQVTNPZlBIN2VWU29t?=
 =?utf-8?B?VjRoN3YzclZDaUxnbjE5SEYveHFSRVhNY1kwLyt4Rkd4bVJnNER5MG5xektZ?=
 =?utf-8?B?Y2hYSFNoMXJkbkx4K1N4RXRNN2haemZ3Nk5Oak1DT2pHSW9CS0hLZml5WlZF?=
 =?utf-8?B?S01qMWg3NlJrdTEwWFZzWG9qanpVeWh2UTVUcXlyNzZla2daTTlLWjJJZVlD?=
 =?utf-8?B?cnV0QzltT0hzTUc0elZGdzF2WWZad3FpU0dldUJRWmhJNkpaWHlnOFpveDcv?=
 =?utf-8?B?Z24zbmFYdHJPaXVRbEYwOUtOMXlpNmxLWXlSSHlrQWxtS1VybWJabW1oUzh1?=
 =?utf-8?B?K1pESWVwS2E1bCszOXVSaCsrWFMxK3FTbTlkZVhyWUZQZGhEVDI0VlhPMHAv?=
 =?utf-8?B?RUVZS2JrTUx1eGlwclpjZ3BtVVdHdGRBMW9UYmtldXltTkxFblQvZVR1akR0?=
 =?utf-8?B?L21HOXZoNThTM2JwWTdsU1c1SVZDL3dSVHRVeVhpNFd3MDBUVDZTQk81VUVw?=
 =?utf-8?B?dUJYcmtHVnRvMzMweWdDV1BlWWdUVmtLaXAzcmJ1ZzZBeHJLQ0dIeDAvZ2Ri?=
 =?utf-8?Q?RGc79+9PCs5kL+KRQT3CoMQwnFTDpY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63611357-9408-408b-c046-08da028633ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:07:44.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qGuXmNeKRZnz/yyMRat8wkNeSmrg23jZxNIiI6TXpYupP6AAMzmTRTbHhYJU/8IczPAF1n8pYgeRrSXlNuFnqLnCD/xD7ZRMEtiGT/Cex7nJSUB4SPcWgmFM+uJXNVRQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7958
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Mar 2022 11:07:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2578

Hi Michael,

On 3/8/22 18:23, Michael Opdenacker via lists.yoctoproject.org wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

