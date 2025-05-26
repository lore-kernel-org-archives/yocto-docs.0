Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40DCC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:15:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.web11.25176.1748250942517308384
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 02:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dkp4snes;
 spf=pass (domain: cherry.de, ip: 52.101.65.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF9VIWL7gXBPNesofD0BpOEJqZEzrrCyeShq56hKCPUH4suTfflWSMrJGIppqZe7SeI4p0MFugIkUx1aa53tmMtf4hrsph7sHLdFgmvUrlD/ciZditkT9+PcvMj7gE96Isse2DYF+s0gCNaR9xpTAwlmzLW9+06VY95S5lmCqyV7h1PGjDsunPzkCasOZqG9JR+qcUtFYjE65BamkvVRpYkBUwwRmEmJtdky4eBiJ6tiReYHdgZQ5Z2qpAMjyhrzirzGgtQYPOqDkDUeuUBvfARzqMYnsWjFy/D10MVyMF2Aus5uIFF0JUvpkRUgvbb+UFq4+7C4sHuobBS/GZwwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Nc33wElWGCU5mkGt2T1kRCaxMgRUyh5qFWyS1IO+wU=;
 b=yqq/LyYfhSc0A0Xyy78CryrQcAS5AUwoz4jp8UrYIkXmV48/uorYl8xNBCS+NjK+JDvtqbCTX/GwO2WsHuWhQPdwSj9iYVzL9cihYDJA7TfSLWL7WpfL5Cui6O0xX8DR9kh+U0qqPlsEKqdAQXjSaNwrczbk6xti885CwlPOZBvgZGzE0neefjrsVzu2sh5d8rwAfocCYixzDHPFWlMouIO2NNHjzOrHmz2f5CKP6SeMxRT0bI9mYhl0WV5T7BPa7MuUEOOFfnPblTMZIrWQgOcy6imecwieF2bPO/alZ3fZEl58o6U/y0E1Iof6Qi0y+QKYCmHfkzb0K1R3H8LMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Nc33wElWGCU5mkGt2T1kRCaxMgRUyh5qFWyS1IO+wU=;
 b=dkp4snesUaNt+S/XWBaYEXC8bI8+RAD5HQIAe2IDa7WKPVYb1cW9Jc12wlio6KzKN5p25tHSvJXgpN1y7FD5kt44V7RO1B036QPY1usfHlmIdpwhNQ2UI1cOFxfoD1nLl1xdZRkPwHin4Kj5ar7pkbL8sPY7JkDwze40Qhzf3A4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 09:15:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 09:15:36 +0000
Message-ID: <181f5a8d-7dca-4931-b42e-64ca82373873@cherry.de>
Date: Mon, 26 May 2025 11:15:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Is it worth adding a short section on "site.conf" to Quick
 Build page?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <e374fbf6-d472-2061-8a83-675cfc9fba30@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e374fbf6-d472-2061-8a83-675cfc9fba30@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: LO2P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: f9940460-47e7-4e37-c902-08dd9c35e05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3lxa0U2bUs1S0FkL2svbXVSSjI3b0FCUUh5SEhoMjAxb1JLZlBOWkJjeGdO?=
 =?utf-8?B?VGZoNG9LcG85OHd5ZnIwdC9pRS8vQXJPejNZc0JYcUZkUjRaeHlyZVE5Tzdq?=
 =?utf-8?B?ZGgrOHFqKzRqTlp3OGZVdFQyRDFYNHlWTmFmNlU4N0xYdmNvWDF0Wk9wWktI?=
 =?utf-8?B?cHZ2N3RpcVU0Rk1QcFQ1N1dHT3JodU41ZEZxSk9MbVEwUmtyYXo2ZG9kcG1G?=
 =?utf-8?B?THZQWFRpYnU5U04xYjlLMHNNcC9mR28zcWdxaVFiSVE0RVpOeGxBMG96WUNJ?=
 =?utf-8?B?L0Z5Wi9QdDBweDV1OEk3aFpvRUFnUDMrd3hYYURmOVhkd2xta0N3ZVNHckJ4?=
 =?utf-8?B?ZU5GZVYrNGxaNlJIR3JLWjhLSGF5TlVyMlJpUTJuWnc4YWtNV3d5UWRhOFJQ?=
 =?utf-8?B?aDZDSk9LK3o4Q0k2aXd1SDlXZExZaDNUQms5VUU1Ynk3MS9qL2ZNK3VKbDFW?=
 =?utf-8?B?ekJIN1hqUTJsMy9FQUdacTd0MFo1TUZTK3lrKzF6cFl0SGR0VkpFMWpVdncw?=
 =?utf-8?B?WWVNVXUxTmJHSHBXdXRHS25Ib3RqdEo1T25lZ2lEN2UydlRkb3ZsMDR1WTIx?=
 =?utf-8?B?ZkFhWUxhclA0emNWR1dBcUVjb21EOUJJTUNTTVZDaHZrTXVEeitPcEdVb2RM?=
 =?utf-8?B?d2NjalBTZEZrdzVzS0FsdXdYWmdURktHUzZBNWpNeUpGK1diSkljWmFTeDg5?=
 =?utf-8?B?Z045YUpJTlgxSWNFSzFPbFlxcEpuWTVWZ0REUWZuNnprZ1RiNk9SZWRoc2dY?=
 =?utf-8?B?Z2NJVlIrd2xjWC9VYmRYSDhWZVRmUUVPTmdRa2wxK0hkaFoySUtIZElCaGt6?=
 =?utf-8?B?RVJ4QTMvUVdKZVllelptY3dKMHpIMkhIMTM3bittU0NNVDBtdU4xdEhTNlRr?=
 =?utf-8?B?a25vRllVMjJZZm40KzJqZ0UvcUZiVkorcisrK2NDZElmUStEMjZXS3ZCU0xI?=
 =?utf-8?B?blhucDM0QTJRNnlBLzhsZWhJbzBoUEVlOVpYRkh5eUs2TGJ0WmNmbG5pYTNN?=
 =?utf-8?B?RUE2dUN6Tnh4M3pTUXNrWWY3c0tLYzVUR1M0VTFjeW9iOUVWclZkM3ZvNWwr?=
 =?utf-8?B?alMyTXhRdWZUVTRHaitmMGZ2MU1YQW9wa0tUMHgvRFkrb21vRzhHKzRLODda?=
 =?utf-8?B?OG11SlpNSHB6aU55TU5PaGl6eWZKdVArQkttQTZLUTlVVlZaR2ZRTXVBazRG?=
 =?utf-8?B?bmV3Z1N6ZW5WQzBPalpqQ0lrVGRmS3g5aUNYZVZvb0lYV29jb0pqOVJmUG84?=
 =?utf-8?B?OEltWXhzeFhPSS9Ba1JGeHJNdEdqaEFkQlhaTk9zOTQwY3JEMFVwTjVFV2sv?=
 =?utf-8?B?UDJ3d3M0SmtRb3pjaGltRyttSlJYVWIwajdPTTlyczFvNS8xZGoxc2pINnlS?=
 =?utf-8?B?bWxEOVVjUlhpTDRjR3UwZHd4enJOSkZsUXRvV1EyaUE2MzdnaWdtdEUvdWxB?=
 =?utf-8?B?Qld6SFhTd1NnN0dVdU10bi9XOVd5dVlPWG43SHBJUC8yTDB3Qm0rd0tnZ0s2?=
 =?utf-8?B?U3JZTGhSc2NGeGVhcEFNTTVtRjJ1N20rNFJjK0E3MUY4dzRHZnBObmg5Vm9R?=
 =?utf-8?B?Q2hSd0ZMRWJLZFpoRTRnbGpncDRZSlphOVpFd2RPc1k2R3dkaGFnRnRtVDN0?=
 =?utf-8?B?bjVVYkJlaElFMGVYZ3VlV0F5TTY4RDZrZCtLRWRJSkw5akpoaDN6Z0xRZEpx?=
 =?utf-8?B?MERNQnQ1T3c2aWxSd2JoWDlSaFUzWGwvZk51eFFkVHdKWHlTcGN1UG1rbFEz?=
 =?utf-8?B?TDNBOHlmU3dUUW91SWpXRjJCMFhjWlN5TkZnYlBOU3U1Rk84eW5uU0puZGI1?=
 =?utf-8?Q?twHKS5YbJiVuBeBLjiCYCMuUK03vG8P3Kn7uo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXljUmQ2TGpmbDQzUVEzREk5MEltQmJiQndTVUhidzRpanVxRzNGUVdLWkli?=
 =?utf-8?B?ZWpnU2FlRTRTM3ErOVdUWTgrZUR3QURGaXJ3Z0pEcHJLazlqWEppdW1vYjBV?=
 =?utf-8?B?S2xEQzdMV3l1TE9vNVhWUUdQMEhrNDE5eC8xdW9YYURFSzJybkVpaW9EU3pK?=
 =?utf-8?B?eWtHYXZBZjdSQWpsazRvUHA1SlRvcWJlaWM0dUhBUGlGOXBUMSt6bDFVc2hu?=
 =?utf-8?B?TGFNMmhDdDhNM1J6YnB1aEFiY2lXMk5mQmR3NDN2N0t6RzVXLzFPZUNibmZP?=
 =?utf-8?B?MmRHSkZUR1ZFSW9rWFREdll1cXVSYnZtc0t1ZTFMMHFQMzJSSXJJS0FsZ0ZU?=
 =?utf-8?B?UEpMdGVyQ1lXQUROYUJnZlh6bDZxYUpYUXNqNm81OXRQblI3RFBXVzNpUzda?=
 =?utf-8?B?Ny9qdzdFZHFoT1FJSHJYUit6VkJmd1BwQ3dhQWcvY0JVK2NQTFlLRm9nbWFr?=
 =?utf-8?B?ZDQ3djh3Zm5GQUNpaC83MlgyYzNXNmNsanhnaEZlTEhlR00rd1F6a0tiTTd0?=
 =?utf-8?B?S3JrU2ExdHNVNW5wTEJqdzA3QTNPS3RSM0tMRGtsMFdneHdhb29wUEdPQ2ln?=
 =?utf-8?B?N1lERGR5TFl0VE1BUDNjenVhb3FZWllmVWhCamp1Z2F4ZjZaMnMrNmtYRno5?=
 =?utf-8?B?eEJURVh0dHBJTnhyR3NBRDlTSFg2cm5ZUWpORjNBaHZMSis2RGV2d3o2V0Nm?=
 =?utf-8?B?bzlsNEJtUUxGaTNGRnpPbENnK1Fjb1pZSDVuMUdMaTViR1JiNlMwOXBFWGMy?=
 =?utf-8?B?WExwT01wZkRrQlZHZHV1Nng5ZDNSKzNyWGFjZTBsbE5DNlBqRGtWcTM1b3FE?=
 =?utf-8?B?eXptWmxUa1A4S01nL2Y5MWdCTnZqSk1nM0RWQUtxWFV1VkQybmZNOW5xR3gz?=
 =?utf-8?B?aGlpWEVrVWwrZW9leGFjVlJkOUU4Q3dhQXVycUszenJlR0w1a1BTeG1OMlFG?=
 =?utf-8?B?UGJ6ZVg0S3R2OWxJaWcwKzd6ZFI0WEF2RWd1TGRQSlJxOFdZZ1VGUFRLS0x5?=
 =?utf-8?B?SUVVT0U2c0U0Z1RDZnpZdVRuVWpJaXhrUS9MZ3ZsRVdHUEtWdlgydHJFdHR2?=
 =?utf-8?B?Wk9JL0NrcHNNR1Y4K1h2cUsxY0t0RU82dFYxOGZEQ0RYOXNDWFFyaitxUi9v?=
 =?utf-8?B?WFZTQ1JYbzhkcWM4a29GNlRFN01hNlRYd3VYRTRlK1VaVFNVYWxJd1o3Q05B?=
 =?utf-8?B?cUhLTmdDRVFINFd4NndPL0NCNnEvdlRtblNvSDN1amJkRlhIK0x3dW9YbmdJ?=
 =?utf-8?B?ZC9sQW00WWduOEZneitCcmMyMEtxT2hRTUhrOGhqQTVqcHFCRlAzZkpKbTQ3?=
 =?utf-8?B?bHk4TWxwckJ1akNmMjljUUxQNUNCR2VQeUw0eFRIL1FJS0NsS00vQ0tDenhM?=
 =?utf-8?B?QTVQVEdqbE9iem9YK1NvVkdQTGZLMVljOEgrTGZxbjFUempPSy9pTnQ4dHFi?=
 =?utf-8?B?R1o1QkxtVVFkZ1lncEd0VDlvdXlqTVZTaUFZaFkvbDBxTlczUjh4ZlpJL0RD?=
 =?utf-8?B?QU9LcnZIVm1vSWoyVEpVYXRENjRyVGlBNkxCejFseW5WYVNTQmlxeEc1YXVu?=
 =?utf-8?B?ZDlISFFJc0VpWStqanlhVE0zQnJWOEhZcU5FU1NFMlU1Y2FvbThNYjYxK2lO?=
 =?utf-8?B?SWdiQlZObGw2N0pGa3ZxTmppQ1V3dStKNk12WFprY21OM2hWQ1g1OTBYbWhW?=
 =?utf-8?B?SE9HeFV4alYzZnhRa214V214cnVvbE14MGlYTkxVdjUzSFg2aVFWQkFHVGFy?=
 =?utf-8?B?WFJsMlVsRld0eGZORU4yS1k4YjlXMHNjSVI5Ny9scUYydkwxTXV5S1ZOYm85?=
 =?utf-8?B?dlpVdE9KOUF0ck9zMHRZRDlHcFJFQTM1RGhSNHhGNk82WWtaSlRhNkV6VU5Z?=
 =?utf-8?B?SlplTmVaVEhDU0gvdlhLYnRNbHJHTEFuTWM5MlVwVXMwZXJ5MTBRVmZxUWwv?=
 =?utf-8?B?c0NpREQvelUrL1FUcU5xZDczU21mK2dibHFHWGo1WUx0QzhoZ2daQ0xWMWlL?=
 =?utf-8?B?WUdORnZOSUVMcUJINzlQcmd3SzQ5MUE4a1F2cU1pTzR2WE5malBhUnBhSHVS?=
 =?utf-8?B?OTBDNnZiV0JjZDhmakp4ekZkMUtrNHRzSzhpUG54ckJlYVNKRk1qQklmUFh1?=
 =?utf-8?B?MGJaYlpuVlhXR2Fsd0RYM2o2alNmYVBjNEdQemZ3c1NPMUdWT25iUTJNMVBx?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f9940460-47e7-4e37-c902-08dd9c35e05a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:15:36.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjZmfPqBFFGeZqNJuWhPU+eIhN3jLe1HtoVXdi/9c9pU/neXOBQEx2FJrEVBugQaUbUcJS49+Y2RH4SEntxEbpmpNCBMqnLvDvOX5GaRQwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 09:15:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6919

Hi Robert,

On 5/26/25 10:02 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    I think it would be useful in the Quick Build doc to add a short
> (maybe two paragraph) section about using site.conf to cut down on
> duplication.
> 
>    Say, just before this section:
> 
> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#customizing-your-build-for-specific-hardware
> 
> a top-level section called:
> 
>    "How to minimize duplication with a site.conf file"
> 
> As that page discusses how the new developer needs to edit local.conf,
> it would be useful to say something like "If you're going to do
> multiple builds and find you're making the same changes in your
> local.conf for each one, consider creating a central site.conf with
> those common settings, and copy or symlink that file into each new
> project."
> 
>    Or something like that. Not only would it speed things up, but it
> would also make the new developer clarify what should be common across
> all of their builds.
> 
>    Should maybe include a short list of the stuff that is typically
> common, maybe ...
> 
>    - BB_NUMBER_THREADS
>    - reference to local mirror
>    - internal proxy settings
> 
> Thoughts?
> 

Easier to review and discuss patches, so just go for it!

I've never used a site.conf file so I'm probably missing out on 
something and will learn something new with this :)

Cheers,
Quentin

