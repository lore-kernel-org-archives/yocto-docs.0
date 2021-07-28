Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web11.2307.1627462014784840630
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 01:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=rMEu5eA7;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.42, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfgTuKwb+948UU38OjNR+1R08LpvtNEWv9MH5mN4FwVKT88SHMG3evvYRnCZELOSfIuVvnKpBIgKjMpNBU7cBbKBLxQgIuh1QETZBDTEduT6hJxoGjxo2o8C4BSDL9mTZGhdOvPEodHYkDyvZ1Td15BFVr73WfbrpeUokbJ/m2wZ/W98wzRVsGCo6UycmGNxW+yyyEVBDgvL0l3H5py03ZSF0pb7xGtW5S2CL2qN8nWQJmzCp0usGRQriCs/vwJTrhWUdcrGGXtl61YS5r/5Fkymr2e3X1PNsiLT1UoFB1o1g72ZC76W4i7pt7Z7+QxqnzZNvCplJYOiLTZZX9ZIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A865JBoUfYTLeumZ61gh+WUPn2H7VZIMGgVUc56M/1A=;
 b=cgbjIMa6CnES+7k/Xo/oMfUvJBQTigdqO0i3dAGeaZ5osA16KuKqrLXu2sP/vK+V7jSId06SnOWHV61BZ15JRwFfmqdUhAL46L5yhOnVbxwvzQ0HF/jjhlplgW+1NYYgDnkykuM9GPEM9MPtkiD1OUoMZku8q4ctm2ktIFiCmvlGvNZkip5LCTTMrmBLsuLZtjl2+T7ie4Bgbphg3IIlfCLO9NU6uYql80XbRC7izlSx6kSY4O4MGBt3eQ9AuQdfhPLlLFdFK3CuzgVq1NsBqBRVQc4yhHGHa2BY6uEVHl1L/qA7TkAJ8pi91l/wIjCvGRbGV0T6yBUPy6D/bQ/5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A865JBoUfYTLeumZ61gh+WUPn2H7VZIMGgVUc56M/1A=;
 b=rMEu5eA7EfYRlV0xXKegbJpGc8ymInV6XFo4WpMG/K18bHrLOL3LQQn01CmThhOI1B/E1fJrYtdC9y98U85RLPDcObDMcgeJVeB2pNMlVcczjLzTG88D0wVMCHAEyHuv8cUWJgCq2uoqSKJqU2Nx9n/rehJ5nJRyiFRwF4AB+VY=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5457.eurprd04.prod.outlook.com
 (2603:10a6:208:115::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Wed, 28 Jul
 2021 08:46:52 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 08:46:52 +0000
Date: Wed, 28 Jul 2021 10:46:50 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 2/3] manuals: simplify references to BitBake manual
Message-ID: <20210728084650.ynbq3fofbe2c3jug@fedora>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
 <20210727171147.132288-1-michael.opdenacker@bootlin.com>
 <20210727171147.132288-3-michael.opdenacker@bootlin.com>
In-Reply-To: <20210727171147.132288-3-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM0PR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::15) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR01CA0074.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 08:46:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe6efa3-310e-4488-493a-08d951a43ef1
X-MS-TrafficTypeDiagnostic: AM0PR04MB5457:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB54575D52F62658BA807C9B83C2EA9@AM0PR04MB5457.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NESmQHICSg1mqDD92NGrzxeewQu8HcGS0Km7wO8lkxrNh7HFVdF9Z20egbn50fN8UmZaI3BM9VWYFGwIcShT3xHtjZb78srnfsXv6Nzb0om8i3dJ3KVwD6IPRMOOlhTQ3tXQStwxX5Buxpa+6zI0OZAS/k3SGfn01Ie1MG/u9jw+F5v3T8eZ6aWvF4Y4TzGe+HG4iONT9ZTL2RNq2e8ZVHv05y2kstgYwTarffSDsqVmzhSkF14S+/0rSPQqvvUnJvR1lG0eMrkKiz3LDCTuvNxyadNSAWhRoCJ4J43S7wx13xCGsLGY9J6AA8CjVBcR/l9SQ0DLn6qdO251oTCUwns7VH+ao7HAmPmxwQS18RIzgg8nKKt8FDEiLHmDyaUEt5eXvUEKnGtfYbrw26GBX5UkGgF2WWC5aeaYvl2/qwYtSNUZQwd/tT0e5wTtNAbcSJx2Zi4cDqD7OeThGhlaKwO5u0EGqjZBbUaQLjlbfd1dm3O5C1s0UaaUtevUjySjGiMNYLw3T6nuGb30fDpnTS1WWjNxyJGzauzwKn0JmPUOVW3S5lGVhFisb/YvB8EAHTJeZ1xvRNSU8qcxwFDA9uizaVwCrMObqbOgeSNlXyD0DquPn3pc/vZVN0yzQqjXmRCtsvDmcsqnBTiGn6E1y9eJIiV0o6Hqh36U3Rr3s683Zbz+GmkHJRf+AHsv/r/J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(39840400004)(346002)(44832011)(2906002)(6916009)(186003)(956004)(26005)(86362001)(33716001)(83380400001)(38100700002)(9576002)(4326008)(52116002)(38350700002)(8936002)(1076003)(8676002)(66476007)(66556008)(55016002)(66946007)(6496006)(478600001)(9686003)(316002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rzRQ3kfZ33HJVCT+6FEa+RHkEuBFdCOmIb/4LfCf3nSAQ5tsR4L6nmEoYMHc?=
 =?us-ascii?Q?iRKgmK3naDdLAZooBB+zjlWwd6kMTW7CtMwdbsmVa3vCOWQ2OQYhDsOEqKdJ?=
 =?us-ascii?Q?bnnmNTinHgYf5d+QUz0QS/asSazQRom0PLpwuobLLZ4U6n56ZxXxCw0F16Qt?=
 =?us-ascii?Q?Tf04KCjFdOWVJL6w8gdv+vnlH5FnP5LCPFFd6zt25DR6EyCalp3K0QS9FTt/?=
 =?us-ascii?Q?o4wnSxDvnh/Vr6c7IB0SH5xhJWwA5Low9cqpSeo7ocJg1/bbYstYbQjvxUxy?=
 =?us-ascii?Q?O10RFf1e5T0+Wv2/Cso34WdPprcvqRtBggH9hZjcw4WpPctIdDeWDtcB+RDw?=
 =?us-ascii?Q?0FQa+Szr9vH/iipQiR0eIrTEnCB3XVK/DgAV2MLzjZ5ujJlo3zI58FXv1IbC?=
 =?us-ascii?Q?1EromAZm5tvcNk1TIGx8lEPWKx/AMGGV0cmpbFEwzGebakRtHQtoOqwJuuRS?=
 =?us-ascii?Q?THeOSfdlf81NUlwmcv3CZ1CrAOA9kYR4M+zJYSI9Vam+Cc1KBUrMA4CSzv6P?=
 =?us-ascii?Q?bDiep3+ip6KNkbuYbNtsnEpWhkHycr7wFOe1/6J0T4pxI6ZLoYJrDWmxeElJ?=
 =?us-ascii?Q?8+z0ckc+wnyGaleWJeyA0qaNjV7YbztKbVGp9WuT/gbch5OyTXLvwFiGZjoG?=
 =?us-ascii?Q?80TqVBA3cz0NboZQdxUnRN9HfltFXudwpbVsZdUWr/R2gvA07MvK+ztqeok9?=
 =?us-ascii?Q?xgwuGdWnDLz/kN8eVAg8U7rOg4IR8VV1PIsPDdHBrjSpDpzGmM1SzJUGFZaU?=
 =?us-ascii?Q?E+r5pzwfHoBZrrwYMHoQeNrTWJwrlzX8vmOkZEC882S7AO5Qr49dZMXvPE2G?=
 =?us-ascii?Q?gJh0KP1L9kPlZfVVMro7agx/aU2h/Lv+XTmvKyiAlpe4AqzR/MtOUr4yVkhA?=
 =?us-ascii?Q?FZOJs7W02iMPi1wPasEecS39g8XGWzjLAEOU1TNlqbqjL+1rBlvEO1WNw59q?=
 =?us-ascii?Q?qP37AMzN7uFTWq13jQ6HGjR5CidyKqlNDMrPOfvbiVXpyLY9FvaJpBk0I1OF?=
 =?us-ascii?Q?sacsPcd76UH7eHFzTi/IsF1h+7kvIlDdS7/EuajR2cZhreWZ6O06+rfBO4AV?=
 =?us-ascii?Q?wQBI77/8MNBQt2oxcm4c+77Vo8nIz4+vJCLwetXlVkmX/d0hNSYjsbrAFUBN?=
 =?us-ascii?Q?hEVxPlHFV9pvMMT5z1o6igB26NlUS8+HfUnneXxuNlGElpIjSqH1zr6UYgC9?=
 =?us-ascii?Q?9HBfWQl9JjyfFDrPm/9xRhXhj0lKdbyE4LcAh3Tg34/4S0Ft6URBWpZY2ydd?=
 =?us-ascii?Q?V0Dn7CaieUmZmDzI8CCJzuEiVhsjiKT0gNebqwGO1gzP/mAo/v0d6n2RP4aN?=
 =?us-ascii?Q?99UoDITysQ61GNnzuYz3qmtG?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe6efa3-310e-4488-493a-08d951a43ef1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 08:46:52.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu1kMUHlYB7D3aNcTX9QH5Bxo7YbmF+G6dg719E9HTZ1L/UpR207EpAmk1lj7jYOgnQzSOmcIHN7Sm1C4saEv3UiPAZcOC4+IgnkKE10Zx3NzsRelGC4UUo6hrl4nR9e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5457
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Jul 27, 2021 at 07:11:46PM +0200, Michael Opdenacker wrote:
> Replacing ":ref:`section name<bitbake:bitbake-user-manual/bitbake-user-manual-<section>:section name>`"
> by ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-<section>:section name`"
> when the reference description is the same as the section name.
> In this case, that's unnecessary to repeat the section name in the description part.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst     |  4 ++--
>  documentation/dev-manual/common-tasks.rst        |  2 +-
>  documentation/migration-guides/migration-2.4.rst |  4 ++--
>  documentation/overview-manual/concepts.rst       |  6 +++---
>  documentation/ref-manual/tasks.rst               |  4 ++--
>  documentation/ref-manual/variables.rst           | 12 ++++++------
>  documentation/sdk-manual/extensible.rst          |  2 +-
>  7 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 8e2f2d423c..e999d925b8 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -267,8 +267,8 @@ an entire Linux distribution, including the toolchain, from source.
>  
>     For information on using the ``bitbake`` command, see the
>     :ref:`overview-manual/concepts:bitbake` section in the Yocto Project Overview and
> -   Concepts Manual, or see the ":ref:`BitBake Command
> -   <bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command>`" section in the BitBake User Manual.
> +   Concepts Manual, or see the

Spurious `the` since I assume it's part of the section title just below.

> +   :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command` section in the BitBake User Manual.

Otherwise,

Reviewed-by: Quentin Schulz <foss@0leil.net>

Cheers,
Quentin
