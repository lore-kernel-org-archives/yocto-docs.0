Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3850C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 10:37:31 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web10.9917.1652265446157510701
 for <docs@lists.yoctoproject.org>;
 Wed, 11 May 2022 03:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=I+1OJIWS;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.79,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fvh/GAqqkAgjHs7OUKR4fjLabpUBdPpOSN67wPkakRvDWBtby5p+Wbf0EPLYn3WD/IfQf3UaXkJAoDyd4eigvb4DEEA6vTUoYnQHJQc9SO791TnObFC+1JMr4D7rIxcZJGzc3YVvbP+j1BoKSuULZZaS15OEa5ewzobWSXHveMPP3EKU3Eo3HQvh/0zlMauQ5rE/GA5P+NClXH5AvPFNMHIeKmWQ/6l886HiqliJdxnpHAP5Lr5XsmKrCJzobVbOfFvZaCaQP25vQKRttxXn90dLLAIY7Fub10sj7PCYuMOlyVeQdLlyYpuF26PnXiROwUStCs+9TndbtlDNjFNF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4fTs+fn7C9eEawpxL1Fux9X0v+Nhxs3/1q7WjfsqFk=;
 b=oYiq/gnvFSSQxnOZWKOcGZ6IrMtoNfxgbKlstPPBj1UYG70Xwkimvq2apYY4dmnp1PnPHFMrK5/PzWQ4/MmAZgTbfKIvZJ85+mOSEgtIoKYKf4HXaz/omLO/ftz7eAF5jXYfxUmlrKjrXummdahLsGznr4kD7/mux/6MMU0MdG01qn7ezkGHb4KIoGnnv/ozBQMQXMe41oGLhbxhpuiZPofZq/ni+wzS78XiOfq/P7ri/sVS/658RV+u0kM4EF4t5HcZ0yXjN6c1LqDgdkUDhMI8Ki3x2z4wDPqNqCCe425yjCP7590tPDw5d0wRntCKj0UifTKQhXhzvC4O2bJR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4fTs+fn7C9eEawpxL1Fux9X0v+Nhxs3/1q7WjfsqFk=;
 b=I+1OJIWSL7VwgdyXDZRwpLbEEhwzmv9dk9fZOvksR7Xwh+g7FekAZmW0dzDshc0opxRzUsMjNFfXDBGvUv+S/irfBcZJZY7ZhN28uxmH/KKt4brYMBR3mEZId11qFML6BMonWTwluIFE6qAaUEGUPLHvVOmvQlC5BrTs1B9n5eI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB6PR04MB3095.eurprd04.prod.outlook.com (2603:10a6:6:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 10:37:21 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 10:37:19 +0000
Message-ID: <731ed051-1887-c9a3-f09e-1003113d2e89@theobroma-systems.com>
Date: Wed, 11 May 2022 12:37:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] is there an actual "Getting Started" guide?
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <e9ed828b-e775-66e9-5d28-b1e7499adc6e@crashcourse.ca>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <e9ed828b-e775-66e9-5d28-b1e7499adc6e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0045.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28373b20-3035-42e6-cc51-08da333a39a2
X-MS-TrafficTypeDiagnostic: DB6PR04MB3095:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR04MB309588AF1DBB571C925C8EA3C2C89@DB6PR04MB3095.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fyP4RFPdHi2EE0PsWsqepGlrfOJjoeY98YNiMCsZroPad5FSzTkdbbN4XkTKsQc3iu//Ib9caWn4dxHviUZfj8wLI5VMhYyHISlM5sJ9IQISqcVlJhzBKJf/Vkyg9X57MFELxJGR6d3PG1eXh98M+pOu5XZ46U8pm/xJWzDjgjJmdHxZeR4B8NJeCvAMaQpCZQVXsbb28Z3HOPskBkVICm2c5jz/rgft30zZ3cRQxjv1RakLbslrd2vAJPtu/2jj7YqwWocEm3513lfjDma94xg+yaJo1RCpCzKNxFLMu0YPNzGKISH7rbD1su989Y2+MTgWyNk1v75Ct40uLVcyTqoX7ledPRu3XwvL8lK2b6TLKFaAb1QE+tomE0WDu7ByymcjfpSk2PSiCzk35o1b91w3/fyq5/cQUUFNlNq46woVkW/DoT/3unpe5Lr9JZ1kCWq/cQgsW0vzok5SLafXlQHVGewuewADHvDTJ9z9cbvkY43eaTP+u61J2fMjWnRxUqld6F5KED7b4f53J0tUlnHG15IBibDSWNi/tG6D1gVX/xmXLv/T6gbhMMMdRLulKVs06QKjrPgQBql44S1FU7jSgqme+HG7Uh2n4o/4vGPkOaNBPKHB+E2juetSQ4eRdA4IvZe1Whiad8iaFhmceWEU9TjrTjt+yfdymwAUgr8xTyGTFl43qcG42k6F7UscByp8eUhkQ/MbwN3xsS5FXeoSrDnecDQTo9bOd6/FVpL3tM9RW1KrD/62MvRqHjplnGNoVJz/oyexrlhDq6SlXs0CYGZdVOBAGEY56ypSxfbmMcyEMII94I4PAiokyYzx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(966005)(66946007)(66556008)(26005)(66476007)(110136005)(508600001)(8936002)(6486002)(2616005)(5660300002)(6512007)(38100700002)(6506007)(53546011)(8676002)(316002)(31686004)(36756003)(2906002)(44832011)(186003)(4744005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TWhUa2FwaW5Eb2E4UTNOTk4zME1EODRMTTk5TjNsVWFyV0lrWEpFQzVSbXNn?=
 =?utf-8?B?MGJ2SVVsOWZKUFNvZjZzQkp2cTJtaFBneXEwSXB6ZHJxSWVBb1BFZDZGZ05N?=
 =?utf-8?B?Vmp3SVZ1Mm1ERkxvM3RyZEZCTE1YQmVibDU4YnBIaGlEbEZhTElvcWtjWUts?=
 =?utf-8?B?cDU5WldzUGdMcksxaXpkUWxqaUpPaFJ1WmdxTU9FVWdsNHVBMUxjMDIrWGd2?=
 =?utf-8?B?bmZsWWwyMk1ac2EzcmRabWYzbDFVd0Y0K0NCWDFWcjBMOVB2aUxHdTBkK1pX?=
 =?utf-8?B?QVR2UWxPZDJlSUNqYjkrZUxKYkVZSk0rbGViVzk4Qm5pYkp2dG5FUDFQOGlo?=
 =?utf-8?B?dkJObC9EMTJWclloV2N5cEQvNi9na2dkeE1FeXRmVU9LdVJyWjNGRnZTV1RU?=
 =?utf-8?B?ZUIwVlorU085QXJ1R3c4SXRzRGFneU4yM3oyTkNNQWZiUmxNZ0xOdUJmSEtT?=
 =?utf-8?B?WWhIVGtuRkpkNUZxQXhvMnl5WGZzckNlSWd2aFJISkdwbW10RExqM1MxT21L?=
 =?utf-8?B?UWxOMWRqalE4bVBxQ0V0RUJ4MFJLMEhJR0x0c1N2cy8zNHkrdnpSL0UxcmVR?=
 =?utf-8?B?YlVKZGtycE5nUTkwYStLTlR0ZCtLRWpVNWwrcG0rZ1Q5RllORzRqb081VTht?=
 =?utf-8?B?NFZXQmRtWWRzU25wQStGY20yU0lWTi9BSjdnRmNDdXZJTEppMU1RYkxPbm1a?=
 =?utf-8?B?VUhDczBtTVZyZjRVQUc5TGIwN3lDQWd5UGh1djJSM25NMTBGZE9wL1BOU2Zh?=
 =?utf-8?B?VzE4M09wcG4zY0o3eUo1UHFYR0p0T2svMERYcHVpcXNYRVZpSytvNVI4YUJU?=
 =?utf-8?B?WlJadmZCTzBWaE9aQUlBYkNPYzFDaFdacUZsdStrRXhxTzJkRUJRNzZpKzNu?=
 =?utf-8?B?K0JoM21XN3g5QUt0U081dnBma2dseFR6QkJ3TVoyYmlVWGhZSHM5QWIxUEUx?=
 =?utf-8?B?Z0w4SUtDbjh1aldodE0zZkx5TU5xNTRCdlNia0plQmxSMkdoZm1kaitHZ2ZV?=
 =?utf-8?B?Zk1UYmpxTUU5RXBYU0I2MThaSDF1cGk3Z2FUY0tzWVkvYjIwYVNhSTdDVzdu?=
 =?utf-8?B?MUNPZDlkUU5Ca0VwNG9NWDdXUVJUUGNZbXNySEJjRCt0WHp5N2doTHdtZ2w0?=
 =?utf-8?B?VFlmSm50b0crZzVGUkRUYnpyU2F0NXQzNWdYVmNmbEZQYjdKUUhNUDBKZE1K?=
 =?utf-8?B?b1FDRDZGOTdsT3lwMSs2MEJKSzk3VThZOHVzRXJUTFJOdlB6eWFUalpUVzhG?=
 =?utf-8?B?d0tlOHhzZ1N3U2pMWkpoVmdBTUtwU0R5bmtVQnlqdFBNRUxuN2dta24ybVBC?=
 =?utf-8?B?Q2NIUkxiK2o1Z0xvQWNHNFJjcGRTenZ3eGEwVFdZd1VnemF2MTllZk5XSnFy?=
 =?utf-8?B?N1JlNDI4c2hZNkVRYUpCOWg3clRma09xcXBuL2xiRGdReWFjcG5DWWlDMTZ5?=
 =?utf-8?B?dm9jdTVhdW1YZzBqMVJlUXNxajN3SWpJdWhjWDN1YWJrYU5qNGUrOEYwTXdU?=
 =?utf-8?B?L3lBMEgxOFV5cHJ6cU56Zmg3Sm1NVFJKWDkwb0thcTZuZ01rQm5udUw4Ui83?=
 =?utf-8?B?cDU3NkJockhpMGtsZkw2SE5OeTRVdm14cU1wVVRNaGVFTEZ2ZFJ5US9hVmM3?=
 =?utf-8?B?MXZoUXBTVyt3VWZZM0ZIcE5Zc2oxUnc0OUdGQlRWWHNpWmx3ejJweFE3L3V2?=
 =?utf-8?B?R3Rod21hOU5kT2tzNWxEaXh3VHRwcmlpNzZFOG9ubWdXZlg3VXI0VndzWFh6?=
 =?utf-8?B?NHFtUURnTzZqN3diREs2ZFYzSVVXZkVsZm16SkpnZXRubnR2SFhmSjFSQWdF?=
 =?utf-8?B?UG1LYTg0aDlUcVBobnhvbU5WaGFXbHFxSHZ3VzdQa2E4eHhMQ2I5a2Q1VkV4?=
 =?utf-8?B?Yk5lbVVJdlg3d0NkQVZ6dndkZUtKTmJyK2o0NUVqdGlDUjdJZGJ4cEZUZWMr?=
 =?utf-8?B?WTBic3hyRk5iSC9iSnpkS0xTcWRMSVdsYVltbzRxcE5VK2hQR0VMMXo4L040?=
 =?utf-8?B?ZmVSU2Z6bDkzSVB5cm9HRjA1aUtncnVmOW5iRFV5a3FPZS9iSDJ4WklXUG9u?=
 =?utf-8?B?TGlHVmV5YXZpWUkyK3ZqTXhaazhIZFFOWnYvQVAvY3VlSldRM3pieHA4VHVq?=
 =?utf-8?B?NFlyb3d6T0gvOVFnZ3kxVDlITDdqN0pCcndHVXVrUHBsbWphS3psOCsyMVUr?=
 =?utf-8?B?cFdmbnJ5TEZxZjBUVUJJYkFNTjU4d0xadVR0NHlpTWhyTWdRSTBtMW10VGlp?=
 =?utf-8?B?Qko5MUtpalBBTm1tZ1huR1ZDeVA5U3Z2ZlA4MTBacHJ0dnN2TGllakNqUjN5?=
 =?utf-8?B?ODJjenN4RjFuaXAydmRqaWpxUUh2TDAvTldwODJSc1NiREZEZHdVNXJRdUV3?=
 =?utf-8?Q?/tsiLbMTU5Yy/NtXeahvbwOv0A6ICb/+SeBXw?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 28373b20-3035-42e6-cc51-08da333a39a2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 10:37:19.6324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oGWHIPqKVKgc+lAxSHfDoahrGqEPML229t7F1sjm0CFrChoWgRgzOvsVPxl9Rk0J3vzcYkumQGajFmH7j2CaTctyMCJ4A17rg0fcvk3jOOKukP8/JUc/q4Y1zE2KxIcb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3095
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 May 2022 10:37:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2929

Hi Robert,

On 5/11/22 12:28, Robert P. J. Day wrote:
> 
>    was building a fresh ubuntu 22.04 build machine for OE/YP, starting
> with minimal install to see how much more i would have to add, and
> got (via sanity.bbclass) a missing module message based on:
> 
> status.addresult('Your Python 3 is not a full install. Please install
> the module %s (see the Getting Started guide for further
> information).\n' % e.name)
> 
>    note the reference to the "Getting Started guide", which does not
> seem to exist (anymore?). where *would* one go to resolve an error of
> the form "missing distutils.sysconfig" absent a Getting Started guide?
> 

I think this is what you're after? 
https://docs.yoctoproject.org/ref-manual/system-requirements.html

If so, please send a patch to update the error code to point to this 
piece of documentation :)

Cheers,
Quentin

